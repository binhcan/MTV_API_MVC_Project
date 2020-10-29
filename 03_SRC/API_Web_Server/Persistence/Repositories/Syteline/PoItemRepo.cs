using API_Web_Server.Domain.Syteline.PoItem;
using API_Web_Server.Persistence.Contexts;
using API_Web_Server.Persistence.Repositories.Common;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Threading.Tasks;

namespace API_Web_Server.Persistence.Repositories.Syteline
{
    public class PoItemRepo : SytelineDbBaseRepository, IPoItemRepo
    {
        public PoItemRepo(SytelineDbContext context) : base(context) { }

        public async Task<PoItemMst> GetPoItemMst(string po, short line, short release)
        {
            var po_number_param = new SqlParameter("poNumberParam", po);
            var po_line_param = new SqlParameter("poLineParam", line);
            var po_rel_param = new SqlParameter("poRelParam", release);
            string sqlQuery = @"SELECT
	                            [P].[po_num],
	                            [P].[po_line],
	                            [P].[po_release],
	                            [P].[qty_ordered],
	                            [P].[item],
	                            [P].[po_vend_num],
	                            [P].[whse],
	                            [I].[order_mult],
	                            [I].[description],
	                            [IL].[loc]
                            FROM
	                            [dbo].[poitem_mst] AS [P]
                            INNER JOIN 
	                            [dbo].[item_mst] AS [I]
                            ON 
	                            [P].[item] = [I].[item]
                            INNER JOIN
	                            [dbo].[itemloc_mst] AS [IL]
                            ON
	                            [IL].[item] = [I].[item] AND
	                            [IL].[whse] = [P].[whse]
                            WHERE 
                                [P].[po_num]= @poNumberParam AND
                                [P].[po_line]= @poLineParam AND
                                [P].[po_release]= @poRelParam AND
                                [IL].[rank] = 1";
            var poItemMst = _context.Query<PoItemMst>()
            .FromSqlRaw(sqlQuery, po_number_param, po_line_param, po_rel_param)
            .FirstAsync();
            if (poItemMst.Result != null)
            {
                return await poItemMst;
            }
            else
            {
                return poItemMst.Result;
            }
        }
    }
}
