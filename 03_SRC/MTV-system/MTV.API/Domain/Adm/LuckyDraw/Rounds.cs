using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace MTV.API.Domain.Adm.LuckyDraw
{
    [Table(nameof(Rounds), Schema = "adm")]
    public class Rounds
    {
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public int Round { get; set; }
        public int Stage { get; set; }
        public int QuantityOfStage { get; set; }
        public bool IsDrawn { get; set; }
        public string? Name { get; set; }
        public string? Image { get; set; }
        public string? FileEffect { get; set; }
        public int? VideoLenght { get; set; }
        public int? TimeoutAction { get; set; }
        public int? Animation { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}
