import { Component } from '@angular/core';
import { HeaderComponent } from "../../components/header/header.component";
import { FooterComponent } from "../../components/footer/footer.component";
import { CardSocialMediaComponent } from '../../components/card-social-media/card-social-media.component';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-social-medias',
  standalone: true,
  imports: [HeaderComponent, FooterComponent, CardSocialMediaComponent, CommonModule],
  templateUrl: './social-medias.component.html',
  styleUrl: './social-medias.component.scss'
})
export class SocialMediasComponent {
  array = [1,2,3,4,5,6,7,8,9,10]
}
