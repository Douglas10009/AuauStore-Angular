import { Component } from '@angular/core';
import { HeaderComponent } from "../../components/header/header.component";
import { FooterComponent } from "../../components/footer/footer.component";

@Component({
  selector: 'app-social-medias',
  standalone: true,
  imports: [HeaderComponent, FooterComponent],
  templateUrl: './social-medias.component.html',
  styleUrl: './social-medias.component.scss'
})
export class SocialMediasComponent {

}
