using Android.Widget;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using TestAPIGSB.ClassesMetier;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TestAPIGSB.Pages
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSpecialite : ContentPage
    {
        public PageSpecialite()
        {
            InitializeComponent();
        }
        HttpClient ws;
        protected override async void OnAppearing()
        {
            base.OnAppearing();
            List<Specialite> lesSpecialites = new List<Specialite>();

            ws = new HttpClient();
            var reponse = await ws.GetAsync("http://10.0.2.2/APIGSB/specialite");
            var content = await reponse.Content.ReadAsStringAsync();
            lesSpecialites = JsonConvert.DeserializeObject<List<Specialite>>(content);
            lvSpecialite.ItemsSource = lesSpecialites;
        }

        private void lvSpecialite_ItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            if(lvSpecialite.SelectedItem!=null)
            {
                txtNomSpecialite.Text = (lvSpecialite.SelectedItem as Specialite).spe_libelle;
            }
        }

        private async void btnModifier_Clicked(object sender, EventArgs e)
        {
            if(txtNomSpecialite.Text == null)
            {
                Toast.MakeText(Android.App.Application.Context, "Sélectionner une specialite", ToastLength.Short).Show();
            }
            else
            {
                ws = new HttpClient();
                Specialite spe = (lvSpecialite.SelectedItem as Specialite);
                spe.spe_libelle = txtNomSpecialite.Text;
                JObject jspe = new JObject
                {
                    {"spe_code",spe.spe_code},
                    {"spe_libelle",spe.spe_libelle}
                };
                string json = JsonConvert.SerializeObject(jspe);
                StringContent content = new StringContent(json, Encoding.UTF8, "application/json");
                var reponse = await ws.PutAsync("http://10.0.2.2/APIGSB/specialite", content);
                List <Specialite> lesSpecialites = new List<Specialite>();

                ws = new HttpClient();
                reponse = await ws.GetAsync("http://10.0.2.2/APIGSB/specialite");
                var flux = await reponse.Content.ReadAsStringAsync();
                lesSpecialites = JsonConvert.DeserializeObject<List<Specialite>>(flux);
                lvSpecialite.ItemsSource = lesSpecialites;
            }
        }

        private async void btnAjouter_Clicked(object sender, EventArgs e)
        {
            if (txtNomSpecialite.Text == null)
            {
                Toast.MakeText(Android.App.Application.Context, "Saisir un nom de specialite", ToastLength.Short).Show();
            }
            else
            {
                ws = new HttpClient();
                //Specialite newSpecialite = new Specialite();
                //newSpecialite.Nom = txtNomSpecialite.Text;
                JObject spe = new JObject
                {
                    { "Spe", txtNomSpecialite.Text}
                };
                string json = JsonConvert.SerializeObject(spe);
                StringContent content = new StringContent(json, Encoding.UTF8, "application/json");

                var reponse = await ws.PostAsync("http://10.0.2.2/APIGSB/specialite", content);
                
                List<Specialite> lesSpecialites = new List<Specialite>();

                ws = new HttpClient();
                reponse = await ws.GetAsync("http://10.0.2.2/APIGSB/specialite");
                var flux = await reponse.Content.ReadAsStringAsync();
                lesSpecialites = JsonConvert.DeserializeObject<List<Specialite>>(flux);
                lvSpecialite.ItemsSource = lesSpecialites;
            }
        }
    }
}