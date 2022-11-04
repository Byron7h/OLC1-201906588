import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
// para servicios
import {HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EditorComponent } from './components/editor/editor.component';
import { VisorAstComponent } from './components/visor-ast/visor-ast.component';
import { TablaErroresComponent } from './components/tabla-errores/tabla-errores.component';

@NgModule({
  declarations: [
    AppComponent,
    EditorComponent,
    VisorAstComponent,
    TablaErroresComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
