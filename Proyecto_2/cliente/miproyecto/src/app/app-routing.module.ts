import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EditorComponent } from './components/editor/editor.component';
import { TablaErroresComponent } from './components/tabla-errores/tabla-errores.component';
import { VisorAstComponent } from './components/visor-ast/visor-ast.component';

const routes: Routes = [
  {
    path: "editor",
    component: EditorComponent
  }
,
{
  path: "visor",
  component: VisorAstComponent
}
,
{
  path: "tabla",
  component: TablaErroresComponent
}


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
