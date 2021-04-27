using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace DemoXamarin.Pages
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageCaroussel : CarousselPage
    {
        List<UnCaroussel> lesPages = new List<UnCaroussel>
        {
            new UnCaroussel() { Titre = "Green", NomImage="Vert.jpg" },
            new UnCaroussel() { Titre = "Blue", NomImage="Bleu.jpg" },
            new UnCaroussel() { Titre = "Pink", NomImage="Rose.jpg" },
        };

        public PageCaroussel ()
        {
            InitializeComponent();
            this.ItemsSource = lesPages;
        }
    }
}