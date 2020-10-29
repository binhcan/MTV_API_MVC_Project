using System.ComponentModel.DataAnnotations.Schema;

namespace API_Web_Server.Domain.Adm.LuckyDraw
{
    [Table(nameof(Results), Schema = "adm")]
    public class Results
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Ecode { get; set; }
        public int WinOnRound { get; set; }
        public int WinOnStage { get; set; }
        public bool? Status { get; set; }
        public string? Description { get; set; }
    }
}
