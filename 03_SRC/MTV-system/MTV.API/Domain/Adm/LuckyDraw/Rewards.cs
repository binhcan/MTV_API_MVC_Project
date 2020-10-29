using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Adm.LuckyDraw
{
    [Table(nameof(Rewards), Schema = "adm")]
    public class Rewards
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public int Quantity { get; set; }
        public string Image { get; set; }
        public int Round { get; set; }
        public int NoOfRound { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
