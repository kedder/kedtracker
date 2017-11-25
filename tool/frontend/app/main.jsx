import React from 'react';
import ReactDOM from 'react-dom';
import Typography from 'material-ui/Typography';
import Button from 'material-ui/Button';
import AppBar from 'material-ui/AppBar';
import Toolbar from 'material-ui/Toolbar';
import Card, { CardActions, CardContent } from 'material-ui/Card';
import Grid from 'material-ui/Grid';
import Paper from 'material-ui/Paper';

import TrackerSerialConsole from './console.jsx';

class TrackerUI extends React.Component {
  render () {
    return (<div>
              <AppBar>
                <Toolbar>
                  <Typography type="title" color="inherit">
                    Ked Tracker
                  </Typography>
                </Toolbar>
              </AppBar>

              <div style={{"paddingTop": "80px"}}>
              <Grid container>
                <Grid item xs={12}>
                  <Grid container>
                    <Grid item md={3}>
                      <Card>
                        <CardContent>
                          <Typography type="title">GPS Status</Typography>
                        </CardContent>
                      </Card>
                    </Grid>
                    <Grid item md={3}>
                      <Card>
                        <CardContent>
                          <Typography type="title">Barometer</Typography>
                          <Typography type="body1">Item 2</Typography>
                        </CardContent>
                      </Card>
                    </Grid>
                    <Grid item md={6}>
                      <Card>
                        <CardContent>
                          <Typography type="title">FLARM Status</Typography>
                        </CardContent>
                      </Card>
                    </Grid>
                  </Grid>
                </Grid>
                <Grid item xs={12}>
                  <Card>
                    <CardContent>
                      <Typography type="title">Serial Console</Typography>

                      <Paper elevation={1} square>
                        <code>XXXX</code>
                      </Paper>
                    </CardContent>
                  </Card>
                </Grid>
              </Grid>

              <Typography type="title">Hello React!</Typography>
              <Typography type="body1">This is a text!</Typography>
              <Button raised color="primary">
                Hello World
              </Button>
              <TrackerSerialConsole />
              </div>
            </div>
            );
  }
}

export default TrackerUI;
