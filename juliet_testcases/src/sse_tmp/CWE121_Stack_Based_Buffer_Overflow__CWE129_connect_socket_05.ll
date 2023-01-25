; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !62
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_bad() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %data, align 4, !dbg !78
  %0 = load i32, i32* @staticTrue, align 4, !dbg !79
  %tobool = icmp ne i32 %0, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.end22, !dbg !81

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !82, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !86, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %connectSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  br label %do.body, !dbg !113

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !114
  store i32 %call, i32* %connectSocket, align 4, !dbg !116
  %1 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp = icmp eq i32 %1, -1, !dbg !119
  br i1 %cmp, label %if.then1, label %if.end, !dbg !120

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !121

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !123
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !124
  store i16 2, i16* %sin_family, align 4, !dbg !125
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !126
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !127
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !128
  store i32 %call2, i32* %s_addr, align 4, !dbg !129
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !131
  store i16 %call3, i16* %sin_port, align 2, !dbg !132
  %3 = load i32, i32* %connectSocket, align 4, !dbg !133
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !136
  %cmp5 = icmp eq i32 %call4, -1, !dbg !137
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !138

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !141
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !142
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !143
  %conv = trunc i64 %call8 to i32, !dbg !143
  store i32 %conv, i32* %recvResult, align 4, !dbg !144
  %6 = load i32, i32* %recvResult, align 4, !dbg !145
  %cmp9 = icmp eq i32 %6, -1, !dbg !147
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !148

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !149
  %cmp11 = icmp eq i32 %7, 0, !dbg !150
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !151

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !152

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !154
  %idxprom = sext i32 %8 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !157
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !158
  store i32 %call16, i32* %data, align 4, !dbg !159
  br label %do.end, !dbg !160

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !161
  %cmp17 = icmp ne i32 %9, -1, !dbg !163
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !164

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !165
  %call20 = call i32 @close(i32 %10), !dbg !167
  br label %if.end21, !dbg !168

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !169

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !170
  %tobool23 = icmp ne i32 %11, 0, !dbg !170
  br i1 %tobool23, label %if.then24, label %if.end35, !dbg !172

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !173, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !177, metadata !DIExpression()), !dbg !181
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !181
  %13 = load i32, i32* %data, align 4, !dbg !182
  %cmp25 = icmp sge i32 %13, 0, !dbg !184
  br i1 %cmp25, label %if.then27, label %if.else, !dbg !185

if.then27:                                        ; preds = %if.then24
  %14 = load i32, i32* %data, align 4, !dbg !186
  %idxprom28 = sext i32 %14 to i64, !dbg !188
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !188
  store i32 1, i32* %arrayidx29, align 4, !dbg !189
  store i32 0, i32* %i, align 4, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.then27
  %15 = load i32, i32* %i, align 4, !dbg !193
  %cmp30 = icmp slt i32 %15, 10, !dbg !195
  br i1 %cmp30, label %for.body, label %for.end, !dbg !196

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !197
  %idxprom32 = sext i32 %16 to i64, !dbg !199
  %arrayidx33 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom32, !dbg !199
  %17 = load i32, i32* %arrayidx33, align 4, !dbg !199
  call void @printIntLine(i32 %17), !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !202
  %inc = add nsw i32 %18, 1, !dbg !202
  store i32 %inc, i32* %i, align 4, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  br label %if.end34, !dbg !207

if.else:                                          ; preds = %if.then24
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !208
  br label %if.end34

if.end34:                                         ; preds = %if.else, %for.end
  br label %if.end35, !dbg !210

if.end35:                                         ; preds = %if.end34, %if.end22
  ret void, !dbg !211
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32 @socket(i32, i32, i32) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32 @inet_addr(i8*) #2

; Function Attrs: nounwind readnone willreturn
declare dso_local zeroext i16 @htons(i16 zeroext) #4

declare dso_local i32 @connect(i32, %struct.sockaddr*, i32) #5

declare dso_local i64 @recv(i32, i8*, i64, i32) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @atoi(i8*) #6

declare dso_local i32 @close(i32) #5

declare dso_local void @printIntLine(i32) #5

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_good() #0 !dbg !212 {
entry:
  call void @goodB2G1(), !dbg !213
  call void @goodB2G2(), !dbg !214
  call void @goodG2B1(), !dbg !215
  call void @goodG2B2(), !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !218 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !223, metadata !DIExpression()), !dbg !224
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !225, metadata !DIExpression()), !dbg !226
  %call = call i64 @time(i64* null) #7, !dbg !227
  %conv = trunc i64 %call to i32, !dbg !228
  call void @srand(i32 %conv) #7, !dbg !229
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !230
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_good(), !dbg !231
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !232
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !233
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_bad(), !dbg !234
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !235
  ret i32 0, !dbg !236
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !237 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 -1, i32* %data, align 4, !dbg !240
  %0 = load i32, i32* @staticTrue, align 4, !dbg !241
  %tobool = icmp ne i32 %0, 0, !dbg !241
  br i1 %tobool, label %if.then, label %if.end22, !dbg !243

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !244, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 -1, i32* %connectSocket, align 4, !dbg !251
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !252, metadata !DIExpression()), !dbg !253
  br label %do.body, !dbg !254

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !255
  store i32 %call, i32* %connectSocket, align 4, !dbg !257
  %1 = load i32, i32* %connectSocket, align 4, !dbg !258
  %cmp = icmp eq i32 %1, -1, !dbg !260
  br i1 %cmp, label %if.then1, label %if.end, !dbg !261

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !262

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !264
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !264
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !265
  store i16 2, i16* %sin_family, align 4, !dbg !266
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !267
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !268
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !269
  store i32 %call2, i32* %s_addr, align 4, !dbg !270
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !271
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !272
  store i16 %call3, i16* %sin_port, align 2, !dbg !273
  %3 = load i32, i32* %connectSocket, align 4, !dbg !274
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !276
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !277
  %cmp5 = icmp eq i32 %call4, -1, !dbg !278
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !279

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !280

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !282
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !283
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !284
  %conv = trunc i64 %call8 to i32, !dbg !284
  store i32 %conv, i32* %recvResult, align 4, !dbg !285
  %6 = load i32, i32* %recvResult, align 4, !dbg !286
  %cmp9 = icmp eq i32 %6, -1, !dbg !288
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !289

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !290
  %cmp11 = icmp eq i32 %7, 0, !dbg !291
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !292

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !293

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !295
  %idxprom = sext i32 %8 to i64, !dbg !296
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !296
  store i8 0, i8* %arrayidx, align 1, !dbg !297
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !298
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !299
  store i32 %call16, i32* %data, align 4, !dbg !300
  br label %do.end, !dbg !301

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !302
  %cmp17 = icmp ne i32 %9, -1, !dbg !304
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !305

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !306
  %call20 = call i32 @close(i32 %10), !dbg !308
  br label %if.end21, !dbg !309

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !310

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticFalse, align 4, !dbg !311
  %tobool23 = icmp ne i32 %11, 0, !dbg !311
  br i1 %tobool23, label %if.then24, label %if.else, !dbg !313

if.then24:                                        ; preds = %if.end22
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !314
  br label %if.end38, !dbg !316

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !317, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !321, metadata !DIExpression()), !dbg !322
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !322
  %13 = load i32, i32* %data, align 4, !dbg !323
  %cmp25 = icmp sge i32 %13, 0, !dbg !325
  br i1 %cmp25, label %land.lhs.true, label %if.else36, !dbg !326

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !327
  %cmp27 = icmp slt i32 %14, 10, !dbg !328
  br i1 %cmp27, label %if.then29, label %if.else36, !dbg !329

if.then29:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !330
  %idxprom30 = sext i32 %15 to i64, !dbg !332
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !332
  store i32 1, i32* %arrayidx31, align 4, !dbg !333
  store i32 0, i32* %i, align 4, !dbg !334
  br label %for.cond, !dbg !336

for.cond:                                         ; preds = %for.inc, %if.then29
  %16 = load i32, i32* %i, align 4, !dbg !337
  %cmp32 = icmp slt i32 %16, 10, !dbg !339
  br i1 %cmp32, label %for.body, label %for.end, !dbg !340

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !341
  %idxprom34 = sext i32 %17 to i64, !dbg !343
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !343
  %18 = load i32, i32* %arrayidx35, align 4, !dbg !343
  call void @printIntLine(i32 %18), !dbg !344
  br label %for.inc, !dbg !345

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !346
  %inc = add nsw i32 %19, 1, !dbg !346
  store i32 %inc, i32* %i, align 4, !dbg !346
  br label %for.cond, !dbg !347, !llvm.loop !348

for.end:                                          ; preds = %for.cond
  br label %if.end37, !dbg !350

if.else36:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !351
  br label %if.end37

if.end37:                                         ; preds = %if.else36, %for.end
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then24
  ret void, !dbg !353
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !354 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !355, metadata !DIExpression()), !dbg !356
  store i32 -1, i32* %data, align 4, !dbg !357
  %0 = load i32, i32* @staticTrue, align 4, !dbg !358
  %tobool = icmp ne i32 %0, 0, !dbg !358
  br i1 %tobool, label %if.then, label %if.end22, !dbg !360

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !361, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !365, metadata !DIExpression()), !dbg !366
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !367, metadata !DIExpression()), !dbg !368
  store i32 -1, i32* %connectSocket, align 4, !dbg !368
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !369, metadata !DIExpression()), !dbg !370
  br label %do.body, !dbg !371

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !372
  store i32 %call, i32* %connectSocket, align 4, !dbg !374
  %1 = load i32, i32* %connectSocket, align 4, !dbg !375
  %cmp = icmp eq i32 %1, -1, !dbg !377
  br i1 %cmp, label %if.then1, label %if.end, !dbg !378

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !379

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !381
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !381
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !382
  store i16 2, i16* %sin_family, align 4, !dbg !383
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !384
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !385
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !386
  store i32 %call2, i32* %s_addr, align 4, !dbg !387
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !388
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !389
  store i16 %call3, i16* %sin_port, align 2, !dbg !390
  %3 = load i32, i32* %connectSocket, align 4, !dbg !391
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !393
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !394
  %cmp5 = icmp eq i32 %call4, -1, !dbg !395
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !396

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !397

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !399
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !400
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !401
  %conv = trunc i64 %call8 to i32, !dbg !401
  store i32 %conv, i32* %recvResult, align 4, !dbg !402
  %6 = load i32, i32* %recvResult, align 4, !dbg !403
  %cmp9 = icmp eq i32 %6, -1, !dbg !405
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !406

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !407
  %cmp11 = icmp eq i32 %7, 0, !dbg !408
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !409

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !410

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !412
  %idxprom = sext i32 %8 to i64, !dbg !413
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !413
  store i8 0, i8* %arrayidx, align 1, !dbg !414
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !415
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !416
  store i32 %call16, i32* %data, align 4, !dbg !417
  br label %do.end, !dbg !418

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !419
  %cmp17 = icmp ne i32 %9, -1, !dbg !421
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !422

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !423
  %call20 = call i32 @close(i32 %10), !dbg !425
  br label %if.end21, !dbg !426

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !427

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !428
  %tobool23 = icmp ne i32 %11, 0, !dbg !428
  br i1 %tobool23, label %if.then24, label %if.end37, !dbg !430

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !431, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !435, metadata !DIExpression()), !dbg !436
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !436
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !436
  %13 = load i32, i32* %data, align 4, !dbg !437
  %cmp25 = icmp sge i32 %13, 0, !dbg !439
  br i1 %cmp25, label %land.lhs.true, label %if.else, !dbg !440

land.lhs.true:                                    ; preds = %if.then24
  %14 = load i32, i32* %data, align 4, !dbg !441
  %cmp27 = icmp slt i32 %14, 10, !dbg !442
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !443

if.then29:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !444
  %idxprom30 = sext i32 %15 to i64, !dbg !446
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !446
  store i32 1, i32* %arrayidx31, align 4, !dbg !447
  store i32 0, i32* %i, align 4, !dbg !448
  br label %for.cond, !dbg !450

for.cond:                                         ; preds = %for.inc, %if.then29
  %16 = load i32, i32* %i, align 4, !dbg !451
  %cmp32 = icmp slt i32 %16, 10, !dbg !453
  br i1 %cmp32, label %for.body, label %for.end, !dbg !454

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !455
  %idxprom34 = sext i32 %17 to i64, !dbg !457
  %arrayidx35 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom34, !dbg !457
  %18 = load i32, i32* %arrayidx35, align 4, !dbg !457
  call void @printIntLine(i32 %18), !dbg !458
  br label %for.inc, !dbg !459

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !460
  %inc = add nsw i32 %19, 1, !dbg !460
  store i32 %inc, i32* %i, align 4, !dbg !460
  br label %for.cond, !dbg !461, !llvm.loop !462

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !464

if.else:                                          ; preds = %land.lhs.true, %if.then24
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !465
  br label %if.end36

if.end36:                                         ; preds = %if.else, %for.end
  br label %if.end37, !dbg !467

if.end37:                                         ; preds = %if.end36, %if.end22
  ret void, !dbg !468
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !469 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !470, metadata !DIExpression()), !dbg !471
  store i32 -1, i32* %data, align 4, !dbg !472
  %0 = load i32, i32* @staticFalse, align 4, !dbg !473
  %tobool = icmp ne i32 %0, 0, !dbg !473
  br i1 %tobool, label %if.then, label %if.else, !dbg !475

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !476
  br label %if.end, !dbg !478

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !479
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !481
  %tobool1 = icmp ne i32 %1, 0, !dbg !481
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !483

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !484, metadata !DIExpression()), !dbg !487
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !488, metadata !DIExpression()), !dbg !489
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !489
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !489
  %3 = load i32, i32* %data, align 4, !dbg !490
  %cmp = icmp sge i32 %3, 0, !dbg !492
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !493

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !494
  %idxprom = sext i32 %4 to i64, !dbg !496
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !496
  store i32 1, i32* %arrayidx, align 4, !dbg !497
  store i32 0, i32* %i, align 4, !dbg !498
  br label %for.cond, !dbg !500

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !501
  %cmp4 = icmp slt i32 %5, 10, !dbg !503
  br i1 %cmp4, label %for.body, label %for.end, !dbg !504

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !505
  %idxprom5 = sext i32 %6 to i64, !dbg !507
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !507
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !507
  call void @printIntLine(i32 %7), !dbg !508
  br label %for.inc, !dbg !509

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !510
  %inc = add nsw i32 %8, 1, !dbg !510
  store i32 %inc, i32* %i, align 4, !dbg !510
  br label %for.cond, !dbg !511, !llvm.loop !512

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !514

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !515
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !517

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !518
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !519 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !520, metadata !DIExpression()), !dbg !521
  store i32 -1, i32* %data, align 4, !dbg !522
  %0 = load i32, i32* @staticTrue, align 4, !dbg !523
  %tobool = icmp ne i32 %0, 0, !dbg !523
  br i1 %tobool, label %if.then, label %if.end, !dbg !525

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !526
  br label %if.end, !dbg !528

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !529
  %tobool1 = icmp ne i32 %1, 0, !dbg !529
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !531

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !532, metadata !DIExpression()), !dbg !535
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !536, metadata !DIExpression()), !dbg !537
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !537
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !537
  %3 = load i32, i32* %data, align 4, !dbg !538
  %cmp = icmp sge i32 %3, 0, !dbg !540
  br i1 %cmp, label %if.then3, label %if.else, !dbg !541

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !542
  %idxprom = sext i32 %4 to i64, !dbg !544
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !544
  store i32 1, i32* %arrayidx, align 4, !dbg !545
  store i32 0, i32* %i, align 4, !dbg !546
  br label %for.cond, !dbg !548

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !549
  %cmp4 = icmp slt i32 %5, 10, !dbg !551
  br i1 %cmp4, label %for.body, label %for.end, !dbg !552

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !553
  %idxprom5 = sext i32 %6 to i64, !dbg !555
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !555
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !555
  call void @printIntLine(i32 %7), !dbg !556
  br label %for.inc, !dbg !557

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !558
  %inc = add nsw i32 %8, 1, !dbg !558
  store i32 %inc, i32* %i, align 4, !dbg !558
  br label %for.cond, !dbg !559, !llvm.loop !560

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !562

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !563
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !565

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !566
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readnone willreturn }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!66, !67, !68, !69, !70}
!llvm.ident = !{!71}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !64, line: 45, type: !65, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !47, globals: !61, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{!5, !18}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__socket_type", file: !6, line: 24, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket_type.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17}
!9 = !DIEnumerator(name: "SOCK_STREAM", value: 1)
!10 = !DIEnumerator(name: "SOCK_DGRAM", value: 2)
!11 = !DIEnumerator(name: "SOCK_RAW", value: 3)
!12 = !DIEnumerator(name: "SOCK_RDM", value: 4)
!13 = !DIEnumerator(name: "SOCK_SEQPACKET", value: 5)
!14 = !DIEnumerator(name: "SOCK_DCCP", value: 6)
!15 = !DIEnumerator(name: "SOCK_PACKET", value: 10)
!16 = !DIEnumerator(name: "SOCK_CLOEXEC", value: 524288)
!17 = !DIEnumerator(name: "SOCK_NONBLOCK", value: 2048)
!18 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !19, line: 40, baseType: !7, size: 32, elements: !20)
!19 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "")
!20 = !{!21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46}
!21 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!22 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!23 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!24 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!25 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!26 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!27 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!28 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!29 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!30 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!31 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!32 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!33 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!34 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!35 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!36 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!37 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!38 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!39 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!40 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!41 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!42 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!43 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!44 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!45 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!46 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!47 = !{!48, !7}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 178, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 180, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 181, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !{!0, !62}
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !64, line: 46, type: !65, isLocal: true, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05.c", directory: "/home/joelyang/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !{i32 7, !"Dwarf Version", i32 4}
!67 = !{i32 2, !"Debug Info Version", i32 3}
!68 = !{i32 1, !"wchar_size", i32 4}
!69 = !{i32 7, !"uwtable", i32 1}
!70 = !{i32 7, !"frame-pointer", i32 2}
!71 = !{!"clang version 13.0.0"}
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_bad", scope: !64, file: !64, line: 50, type: !73, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!73 = !DISubroutineType(types: !74)
!74 = !{null}
!75 = !{}
!76 = !DILocalVariable(name: "data", scope: !72, file: !64, line: 52, type: !65)
!77 = !DILocation(line: 52, column: 9, scope: !72)
!78 = !DILocation(line: 54, column: 10, scope: !72)
!79 = !DILocation(line: 55, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !64, line: 55, column: 8)
!81 = !DILocation(line: 55, column: 8, scope: !72)
!82 = !DILocalVariable(name: "recvResult", scope: !83, file: !64, line: 62, type: !65)
!83 = distinct !DILexicalBlock(scope: !84, file: !64, line: 57, column: 9)
!84 = distinct !DILexicalBlock(scope: !80, file: !64, line: 56, column: 5)
!85 = !DILocation(line: 62, column: 17, scope: !83)
!86 = !DILocalVariable(name: "service", scope: !83, file: !64, line: 63, type: !87)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 238, size: 128, elements: !88)
!88 = !{!89, !90, !96, !103}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !19, line: 240, baseType: !53, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !19, line: 241, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !93, line: 25, baseType: !94)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !95, line: 40, baseType: !55)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !19, line: 242, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !19, line: 33, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !93, line: 26, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !95, line: 42, baseType: !7)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !19, line: 245, baseType: !104, size: 64, offset: 64)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !105, size: 64, elements: !106)
!105 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 63, column: 32, scope: !83)
!109 = !DILocalVariable(name: "connectSocket", scope: !83, file: !64, line: 64, type: !65)
!110 = !DILocation(line: 64, column: 20, scope: !83)
!111 = !DILocalVariable(name: "inputBuffer", scope: !83, file: !64, line: 65, type: !57)
!112 = !DILocation(line: 65, column: 18, scope: !83)
!113 = !DILocation(line: 66, column: 13, scope: !83)
!114 = !DILocation(line: 76, column: 33, scope: !115)
!115 = distinct !DILexicalBlock(scope: !83, file: !64, line: 67, column: 13)
!116 = !DILocation(line: 76, column: 31, scope: !115)
!117 = !DILocation(line: 77, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !64, line: 77, column: 21)
!119 = !DILocation(line: 77, column: 35, scope: !118)
!120 = !DILocation(line: 77, column: 21, scope: !115)
!121 = !DILocation(line: 79, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !64, line: 78, column: 17)
!123 = !DILocation(line: 81, column: 17, scope: !115)
!124 = !DILocation(line: 82, column: 25, scope: !115)
!125 = !DILocation(line: 82, column: 36, scope: !115)
!126 = !DILocation(line: 83, column: 43, scope: !115)
!127 = !DILocation(line: 83, column: 25, scope: !115)
!128 = !DILocation(line: 83, column: 34, scope: !115)
!129 = !DILocation(line: 83, column: 41, scope: !115)
!130 = !DILocation(line: 84, column: 36, scope: !115)
!131 = !DILocation(line: 84, column: 25, scope: !115)
!132 = !DILocation(line: 84, column: 34, scope: !115)
!133 = !DILocation(line: 85, column: 29, scope: !134)
!134 = distinct !DILexicalBlock(scope: !115, file: !64, line: 85, column: 21)
!135 = !DILocation(line: 85, column: 44, scope: !134)
!136 = !DILocation(line: 85, column: 21, scope: !134)
!137 = !DILocation(line: 85, column: 89, scope: !134)
!138 = !DILocation(line: 85, column: 21, scope: !115)
!139 = !DILocation(line: 87, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !64, line: 86, column: 17)
!141 = !DILocation(line: 91, column: 35, scope: !115)
!142 = !DILocation(line: 91, column: 50, scope: !115)
!143 = !DILocation(line: 91, column: 30, scope: !115)
!144 = !DILocation(line: 91, column: 28, scope: !115)
!145 = !DILocation(line: 92, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !115, file: !64, line: 92, column: 21)
!147 = !DILocation(line: 92, column: 32, scope: !146)
!148 = !DILocation(line: 92, column: 48, scope: !146)
!149 = !DILocation(line: 92, column: 51, scope: !146)
!150 = !DILocation(line: 92, column: 62, scope: !146)
!151 = !DILocation(line: 92, column: 21, scope: !115)
!152 = !DILocation(line: 94, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !64, line: 93, column: 17)
!154 = !DILocation(line: 97, column: 29, scope: !115)
!155 = !DILocation(line: 97, column: 17, scope: !115)
!156 = !DILocation(line: 97, column: 41, scope: !115)
!157 = !DILocation(line: 99, column: 29, scope: !115)
!158 = !DILocation(line: 99, column: 24, scope: !115)
!159 = !DILocation(line: 99, column: 22, scope: !115)
!160 = !DILocation(line: 100, column: 13, scope: !115)
!161 = !DILocation(line: 102, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !83, file: !64, line: 102, column: 17)
!163 = !DILocation(line: 102, column: 31, scope: !162)
!164 = !DILocation(line: 102, column: 17, scope: !83)
!165 = !DILocation(line: 104, column: 30, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !64, line: 103, column: 13)
!167 = !DILocation(line: 104, column: 17, scope: !166)
!168 = !DILocation(line: 105, column: 13, scope: !166)
!169 = !DILocation(line: 113, column: 5, scope: !84)
!170 = !DILocation(line: 114, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !72, file: !64, line: 114, column: 8)
!172 = !DILocation(line: 114, column: 8, scope: !72)
!173 = !DILocalVariable(name: "i", scope: !174, file: !64, line: 117, type: !65)
!174 = distinct !DILexicalBlock(scope: !175, file: !64, line: 116, column: 9)
!175 = distinct !DILexicalBlock(scope: !171, file: !64, line: 115, column: 5)
!176 = !DILocation(line: 117, column: 17, scope: !174)
!177 = !DILocalVariable(name: "buffer", scope: !174, file: !64, line: 118, type: !178)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 320, elements: !179)
!179 = !{!180}
!180 = !DISubrange(count: 10)
!181 = !DILocation(line: 118, column: 17, scope: !174)
!182 = !DILocation(line: 121, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !174, file: !64, line: 121, column: 17)
!184 = !DILocation(line: 121, column: 22, scope: !183)
!185 = !DILocation(line: 121, column: 17, scope: !174)
!186 = !DILocation(line: 123, column: 24, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !64, line: 122, column: 13)
!188 = !DILocation(line: 123, column: 17, scope: !187)
!189 = !DILocation(line: 123, column: 30, scope: !187)
!190 = !DILocation(line: 125, column: 23, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !64, line: 125, column: 17)
!192 = !DILocation(line: 125, column: 21, scope: !191)
!193 = !DILocation(line: 125, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !64, line: 125, column: 17)
!195 = !DILocation(line: 125, column: 30, scope: !194)
!196 = !DILocation(line: 125, column: 17, scope: !191)
!197 = !DILocation(line: 127, column: 41, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !64, line: 126, column: 17)
!199 = !DILocation(line: 127, column: 34, scope: !198)
!200 = !DILocation(line: 127, column: 21, scope: !198)
!201 = !DILocation(line: 128, column: 17, scope: !198)
!202 = !DILocation(line: 125, column: 37, scope: !194)
!203 = !DILocation(line: 125, column: 17, scope: !194)
!204 = distinct !{!204, !196, !205, !206}
!205 = !DILocation(line: 128, column: 17, scope: !191)
!206 = !{!"llvm.loop.mustprogress"}
!207 = !DILocation(line: 129, column: 13, scope: !187)
!208 = !DILocation(line: 132, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !183, file: !64, line: 131, column: 13)
!210 = !DILocation(line: 135, column: 5, scope: !175)
!211 = !DILocation(line: 136, column: 1, scope: !72)
!212 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_good", scope: !64, file: !64, line: 400, type: !73, scopeLine: 401, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!213 = !DILocation(line: 402, column: 5, scope: !212)
!214 = !DILocation(line: 403, column: 5, scope: !212)
!215 = !DILocation(line: 404, column: 5, scope: !212)
!216 = !DILocation(line: 405, column: 5, scope: !212)
!217 = !DILocation(line: 406, column: 1, scope: !212)
!218 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 417, type: !219, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!219 = !DISubroutineType(types: !220)
!220 = !{!65, !65, !221}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!223 = !DILocalVariable(name: "argc", arg: 1, scope: !218, file: !64, line: 417, type: !65)
!224 = !DILocation(line: 417, column: 14, scope: !218)
!225 = !DILocalVariable(name: "argv", arg: 2, scope: !218, file: !64, line: 417, type: !221)
!226 = !DILocation(line: 417, column: 27, scope: !218)
!227 = !DILocation(line: 420, column: 22, scope: !218)
!228 = !DILocation(line: 420, column: 12, scope: !218)
!229 = !DILocation(line: 420, column: 5, scope: !218)
!230 = !DILocation(line: 422, column: 5, scope: !218)
!231 = !DILocation(line: 423, column: 5, scope: !218)
!232 = !DILocation(line: 424, column: 5, scope: !218)
!233 = !DILocation(line: 427, column: 5, scope: !218)
!234 = !DILocation(line: 428, column: 5, scope: !218)
!235 = !DILocation(line: 429, column: 5, scope: !218)
!236 = !DILocation(line: 431, column: 5, scope: !218)
!237 = distinct !DISubprogram(name: "goodB2G1", scope: !64, file: !64, line: 143, type: !73, scopeLine: 144, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!238 = !DILocalVariable(name: "data", scope: !237, file: !64, line: 145, type: !65)
!239 = !DILocation(line: 145, column: 9, scope: !237)
!240 = !DILocation(line: 147, column: 10, scope: !237)
!241 = !DILocation(line: 148, column: 8, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !64, line: 148, column: 8)
!243 = !DILocation(line: 148, column: 8, scope: !237)
!244 = !DILocalVariable(name: "recvResult", scope: !245, file: !64, line: 155, type: !65)
!245 = distinct !DILexicalBlock(scope: !246, file: !64, line: 150, column: 9)
!246 = distinct !DILexicalBlock(scope: !242, file: !64, line: 149, column: 5)
!247 = !DILocation(line: 155, column: 17, scope: !245)
!248 = !DILocalVariable(name: "service", scope: !245, file: !64, line: 156, type: !87)
!249 = !DILocation(line: 156, column: 32, scope: !245)
!250 = !DILocalVariable(name: "connectSocket", scope: !245, file: !64, line: 157, type: !65)
!251 = !DILocation(line: 157, column: 20, scope: !245)
!252 = !DILocalVariable(name: "inputBuffer", scope: !245, file: !64, line: 158, type: !57)
!253 = !DILocation(line: 158, column: 18, scope: !245)
!254 = !DILocation(line: 159, column: 13, scope: !245)
!255 = !DILocation(line: 169, column: 33, scope: !256)
!256 = distinct !DILexicalBlock(scope: !245, file: !64, line: 160, column: 13)
!257 = !DILocation(line: 169, column: 31, scope: !256)
!258 = !DILocation(line: 170, column: 21, scope: !259)
!259 = distinct !DILexicalBlock(scope: !256, file: !64, line: 170, column: 21)
!260 = !DILocation(line: 170, column: 35, scope: !259)
!261 = !DILocation(line: 170, column: 21, scope: !256)
!262 = !DILocation(line: 172, column: 21, scope: !263)
!263 = distinct !DILexicalBlock(scope: !259, file: !64, line: 171, column: 17)
!264 = !DILocation(line: 174, column: 17, scope: !256)
!265 = !DILocation(line: 175, column: 25, scope: !256)
!266 = !DILocation(line: 175, column: 36, scope: !256)
!267 = !DILocation(line: 176, column: 43, scope: !256)
!268 = !DILocation(line: 176, column: 25, scope: !256)
!269 = !DILocation(line: 176, column: 34, scope: !256)
!270 = !DILocation(line: 176, column: 41, scope: !256)
!271 = !DILocation(line: 177, column: 36, scope: !256)
!272 = !DILocation(line: 177, column: 25, scope: !256)
!273 = !DILocation(line: 177, column: 34, scope: !256)
!274 = !DILocation(line: 178, column: 29, scope: !275)
!275 = distinct !DILexicalBlock(scope: !256, file: !64, line: 178, column: 21)
!276 = !DILocation(line: 178, column: 44, scope: !275)
!277 = !DILocation(line: 178, column: 21, scope: !275)
!278 = !DILocation(line: 178, column: 89, scope: !275)
!279 = !DILocation(line: 178, column: 21, scope: !256)
!280 = !DILocation(line: 180, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !275, file: !64, line: 179, column: 17)
!282 = !DILocation(line: 184, column: 35, scope: !256)
!283 = !DILocation(line: 184, column: 50, scope: !256)
!284 = !DILocation(line: 184, column: 30, scope: !256)
!285 = !DILocation(line: 184, column: 28, scope: !256)
!286 = !DILocation(line: 185, column: 21, scope: !287)
!287 = distinct !DILexicalBlock(scope: !256, file: !64, line: 185, column: 21)
!288 = !DILocation(line: 185, column: 32, scope: !287)
!289 = !DILocation(line: 185, column: 48, scope: !287)
!290 = !DILocation(line: 185, column: 51, scope: !287)
!291 = !DILocation(line: 185, column: 62, scope: !287)
!292 = !DILocation(line: 185, column: 21, scope: !256)
!293 = !DILocation(line: 187, column: 21, scope: !294)
!294 = distinct !DILexicalBlock(scope: !287, file: !64, line: 186, column: 17)
!295 = !DILocation(line: 190, column: 29, scope: !256)
!296 = !DILocation(line: 190, column: 17, scope: !256)
!297 = !DILocation(line: 190, column: 41, scope: !256)
!298 = !DILocation(line: 192, column: 29, scope: !256)
!299 = !DILocation(line: 192, column: 24, scope: !256)
!300 = !DILocation(line: 192, column: 22, scope: !256)
!301 = !DILocation(line: 193, column: 13, scope: !256)
!302 = !DILocation(line: 195, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !245, file: !64, line: 195, column: 17)
!304 = !DILocation(line: 195, column: 31, scope: !303)
!305 = !DILocation(line: 195, column: 17, scope: !245)
!306 = !DILocation(line: 197, column: 30, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !64, line: 196, column: 13)
!308 = !DILocation(line: 197, column: 17, scope: !307)
!309 = !DILocation(line: 198, column: 13, scope: !307)
!310 = !DILocation(line: 206, column: 5, scope: !246)
!311 = !DILocation(line: 207, column: 8, scope: !312)
!312 = distinct !DILexicalBlock(scope: !237, file: !64, line: 207, column: 8)
!313 = !DILocation(line: 207, column: 8, scope: !237)
!314 = !DILocation(line: 210, column: 9, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !64, line: 208, column: 5)
!316 = !DILocation(line: 211, column: 5, scope: !315)
!317 = !DILocalVariable(name: "i", scope: !318, file: !64, line: 215, type: !65)
!318 = distinct !DILexicalBlock(scope: !319, file: !64, line: 214, column: 9)
!319 = distinct !DILexicalBlock(scope: !312, file: !64, line: 213, column: 5)
!320 = !DILocation(line: 215, column: 17, scope: !318)
!321 = !DILocalVariable(name: "buffer", scope: !318, file: !64, line: 216, type: !178)
!322 = !DILocation(line: 216, column: 17, scope: !318)
!323 = !DILocation(line: 218, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !318, file: !64, line: 218, column: 17)
!325 = !DILocation(line: 218, column: 22, scope: !324)
!326 = !DILocation(line: 218, column: 27, scope: !324)
!327 = !DILocation(line: 218, column: 30, scope: !324)
!328 = !DILocation(line: 218, column: 35, scope: !324)
!329 = !DILocation(line: 218, column: 17, scope: !318)
!330 = !DILocation(line: 220, column: 24, scope: !331)
!331 = distinct !DILexicalBlock(scope: !324, file: !64, line: 219, column: 13)
!332 = !DILocation(line: 220, column: 17, scope: !331)
!333 = !DILocation(line: 220, column: 30, scope: !331)
!334 = !DILocation(line: 222, column: 23, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !64, line: 222, column: 17)
!336 = !DILocation(line: 222, column: 21, scope: !335)
!337 = !DILocation(line: 222, column: 28, scope: !338)
!338 = distinct !DILexicalBlock(scope: !335, file: !64, line: 222, column: 17)
!339 = !DILocation(line: 222, column: 30, scope: !338)
!340 = !DILocation(line: 222, column: 17, scope: !335)
!341 = !DILocation(line: 224, column: 41, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !64, line: 223, column: 17)
!343 = !DILocation(line: 224, column: 34, scope: !342)
!344 = !DILocation(line: 224, column: 21, scope: !342)
!345 = !DILocation(line: 225, column: 17, scope: !342)
!346 = !DILocation(line: 222, column: 37, scope: !338)
!347 = !DILocation(line: 222, column: 17, scope: !338)
!348 = distinct !{!348, !340, !349, !206}
!349 = !DILocation(line: 225, column: 17, scope: !335)
!350 = !DILocation(line: 226, column: 13, scope: !331)
!351 = !DILocation(line: 229, column: 17, scope: !352)
!352 = distinct !DILexicalBlock(scope: !324, file: !64, line: 228, column: 13)
!353 = !DILocation(line: 233, column: 1, scope: !237)
!354 = distinct !DISubprogram(name: "goodB2G2", scope: !64, file: !64, line: 236, type: !73, scopeLine: 237, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!355 = !DILocalVariable(name: "data", scope: !354, file: !64, line: 238, type: !65)
!356 = !DILocation(line: 238, column: 9, scope: !354)
!357 = !DILocation(line: 240, column: 10, scope: !354)
!358 = !DILocation(line: 241, column: 8, scope: !359)
!359 = distinct !DILexicalBlock(scope: !354, file: !64, line: 241, column: 8)
!360 = !DILocation(line: 241, column: 8, scope: !354)
!361 = !DILocalVariable(name: "recvResult", scope: !362, file: !64, line: 248, type: !65)
!362 = distinct !DILexicalBlock(scope: !363, file: !64, line: 243, column: 9)
!363 = distinct !DILexicalBlock(scope: !359, file: !64, line: 242, column: 5)
!364 = !DILocation(line: 248, column: 17, scope: !362)
!365 = !DILocalVariable(name: "service", scope: !362, file: !64, line: 249, type: !87)
!366 = !DILocation(line: 249, column: 32, scope: !362)
!367 = !DILocalVariable(name: "connectSocket", scope: !362, file: !64, line: 250, type: !65)
!368 = !DILocation(line: 250, column: 20, scope: !362)
!369 = !DILocalVariable(name: "inputBuffer", scope: !362, file: !64, line: 251, type: !57)
!370 = !DILocation(line: 251, column: 18, scope: !362)
!371 = !DILocation(line: 252, column: 13, scope: !362)
!372 = !DILocation(line: 262, column: 33, scope: !373)
!373 = distinct !DILexicalBlock(scope: !362, file: !64, line: 253, column: 13)
!374 = !DILocation(line: 262, column: 31, scope: !373)
!375 = !DILocation(line: 263, column: 21, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !64, line: 263, column: 21)
!377 = !DILocation(line: 263, column: 35, scope: !376)
!378 = !DILocation(line: 263, column: 21, scope: !373)
!379 = !DILocation(line: 265, column: 21, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !64, line: 264, column: 17)
!381 = !DILocation(line: 267, column: 17, scope: !373)
!382 = !DILocation(line: 268, column: 25, scope: !373)
!383 = !DILocation(line: 268, column: 36, scope: !373)
!384 = !DILocation(line: 269, column: 43, scope: !373)
!385 = !DILocation(line: 269, column: 25, scope: !373)
!386 = !DILocation(line: 269, column: 34, scope: !373)
!387 = !DILocation(line: 269, column: 41, scope: !373)
!388 = !DILocation(line: 270, column: 36, scope: !373)
!389 = !DILocation(line: 270, column: 25, scope: !373)
!390 = !DILocation(line: 270, column: 34, scope: !373)
!391 = !DILocation(line: 271, column: 29, scope: !392)
!392 = distinct !DILexicalBlock(scope: !373, file: !64, line: 271, column: 21)
!393 = !DILocation(line: 271, column: 44, scope: !392)
!394 = !DILocation(line: 271, column: 21, scope: !392)
!395 = !DILocation(line: 271, column: 89, scope: !392)
!396 = !DILocation(line: 271, column: 21, scope: !373)
!397 = !DILocation(line: 273, column: 21, scope: !398)
!398 = distinct !DILexicalBlock(scope: !392, file: !64, line: 272, column: 17)
!399 = !DILocation(line: 277, column: 35, scope: !373)
!400 = !DILocation(line: 277, column: 50, scope: !373)
!401 = !DILocation(line: 277, column: 30, scope: !373)
!402 = !DILocation(line: 277, column: 28, scope: !373)
!403 = !DILocation(line: 278, column: 21, scope: !404)
!404 = distinct !DILexicalBlock(scope: !373, file: !64, line: 278, column: 21)
!405 = !DILocation(line: 278, column: 32, scope: !404)
!406 = !DILocation(line: 278, column: 48, scope: !404)
!407 = !DILocation(line: 278, column: 51, scope: !404)
!408 = !DILocation(line: 278, column: 62, scope: !404)
!409 = !DILocation(line: 278, column: 21, scope: !373)
!410 = !DILocation(line: 280, column: 21, scope: !411)
!411 = distinct !DILexicalBlock(scope: !404, file: !64, line: 279, column: 17)
!412 = !DILocation(line: 283, column: 29, scope: !373)
!413 = !DILocation(line: 283, column: 17, scope: !373)
!414 = !DILocation(line: 283, column: 41, scope: !373)
!415 = !DILocation(line: 285, column: 29, scope: !373)
!416 = !DILocation(line: 285, column: 24, scope: !373)
!417 = !DILocation(line: 285, column: 22, scope: !373)
!418 = !DILocation(line: 286, column: 13, scope: !373)
!419 = !DILocation(line: 288, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !362, file: !64, line: 288, column: 17)
!421 = !DILocation(line: 288, column: 31, scope: !420)
!422 = !DILocation(line: 288, column: 17, scope: !362)
!423 = !DILocation(line: 290, column: 30, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !64, line: 289, column: 13)
!425 = !DILocation(line: 290, column: 17, scope: !424)
!426 = !DILocation(line: 291, column: 13, scope: !424)
!427 = !DILocation(line: 299, column: 5, scope: !363)
!428 = !DILocation(line: 300, column: 8, scope: !429)
!429 = distinct !DILexicalBlock(scope: !354, file: !64, line: 300, column: 8)
!430 = !DILocation(line: 300, column: 8, scope: !354)
!431 = !DILocalVariable(name: "i", scope: !432, file: !64, line: 303, type: !65)
!432 = distinct !DILexicalBlock(scope: !433, file: !64, line: 302, column: 9)
!433 = distinct !DILexicalBlock(scope: !429, file: !64, line: 301, column: 5)
!434 = !DILocation(line: 303, column: 17, scope: !432)
!435 = !DILocalVariable(name: "buffer", scope: !432, file: !64, line: 304, type: !178)
!436 = !DILocation(line: 304, column: 17, scope: !432)
!437 = !DILocation(line: 306, column: 17, scope: !438)
!438 = distinct !DILexicalBlock(scope: !432, file: !64, line: 306, column: 17)
!439 = !DILocation(line: 306, column: 22, scope: !438)
!440 = !DILocation(line: 306, column: 27, scope: !438)
!441 = !DILocation(line: 306, column: 30, scope: !438)
!442 = !DILocation(line: 306, column: 35, scope: !438)
!443 = !DILocation(line: 306, column: 17, scope: !432)
!444 = !DILocation(line: 308, column: 24, scope: !445)
!445 = distinct !DILexicalBlock(scope: !438, file: !64, line: 307, column: 13)
!446 = !DILocation(line: 308, column: 17, scope: !445)
!447 = !DILocation(line: 308, column: 30, scope: !445)
!448 = !DILocation(line: 310, column: 23, scope: !449)
!449 = distinct !DILexicalBlock(scope: !445, file: !64, line: 310, column: 17)
!450 = !DILocation(line: 310, column: 21, scope: !449)
!451 = !DILocation(line: 310, column: 28, scope: !452)
!452 = distinct !DILexicalBlock(scope: !449, file: !64, line: 310, column: 17)
!453 = !DILocation(line: 310, column: 30, scope: !452)
!454 = !DILocation(line: 310, column: 17, scope: !449)
!455 = !DILocation(line: 312, column: 41, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !64, line: 311, column: 17)
!457 = !DILocation(line: 312, column: 34, scope: !456)
!458 = !DILocation(line: 312, column: 21, scope: !456)
!459 = !DILocation(line: 313, column: 17, scope: !456)
!460 = !DILocation(line: 310, column: 37, scope: !452)
!461 = !DILocation(line: 310, column: 17, scope: !452)
!462 = distinct !{!462, !454, !463, !206}
!463 = !DILocation(line: 313, column: 17, scope: !449)
!464 = !DILocation(line: 314, column: 13, scope: !445)
!465 = !DILocation(line: 317, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !438, file: !64, line: 316, column: 13)
!467 = !DILocation(line: 320, column: 5, scope: !433)
!468 = !DILocation(line: 321, column: 1, scope: !354)
!469 = distinct !DISubprogram(name: "goodG2B1", scope: !64, file: !64, line: 324, type: !73, scopeLine: 325, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!470 = !DILocalVariable(name: "data", scope: !469, file: !64, line: 326, type: !65)
!471 = !DILocation(line: 326, column: 9, scope: !469)
!472 = !DILocation(line: 328, column: 10, scope: !469)
!473 = !DILocation(line: 329, column: 8, scope: !474)
!474 = distinct !DILexicalBlock(scope: !469, file: !64, line: 329, column: 8)
!475 = !DILocation(line: 329, column: 8, scope: !469)
!476 = !DILocation(line: 332, column: 9, scope: !477)
!477 = distinct !DILexicalBlock(scope: !474, file: !64, line: 330, column: 5)
!478 = !DILocation(line: 333, column: 5, scope: !477)
!479 = !DILocation(line: 338, column: 14, scope: !480)
!480 = distinct !DILexicalBlock(scope: !474, file: !64, line: 335, column: 5)
!481 = !DILocation(line: 340, column: 8, scope: !482)
!482 = distinct !DILexicalBlock(scope: !469, file: !64, line: 340, column: 8)
!483 = !DILocation(line: 340, column: 8, scope: !469)
!484 = !DILocalVariable(name: "i", scope: !485, file: !64, line: 343, type: !65)
!485 = distinct !DILexicalBlock(scope: !486, file: !64, line: 342, column: 9)
!486 = distinct !DILexicalBlock(scope: !482, file: !64, line: 341, column: 5)
!487 = !DILocation(line: 343, column: 17, scope: !485)
!488 = !DILocalVariable(name: "buffer", scope: !485, file: !64, line: 344, type: !178)
!489 = !DILocation(line: 344, column: 17, scope: !485)
!490 = !DILocation(line: 347, column: 17, scope: !491)
!491 = distinct !DILexicalBlock(scope: !485, file: !64, line: 347, column: 17)
!492 = !DILocation(line: 347, column: 22, scope: !491)
!493 = !DILocation(line: 347, column: 17, scope: !485)
!494 = !DILocation(line: 349, column: 24, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !64, line: 348, column: 13)
!496 = !DILocation(line: 349, column: 17, scope: !495)
!497 = !DILocation(line: 349, column: 30, scope: !495)
!498 = !DILocation(line: 351, column: 23, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !64, line: 351, column: 17)
!500 = !DILocation(line: 351, column: 21, scope: !499)
!501 = !DILocation(line: 351, column: 28, scope: !502)
!502 = distinct !DILexicalBlock(scope: !499, file: !64, line: 351, column: 17)
!503 = !DILocation(line: 351, column: 30, scope: !502)
!504 = !DILocation(line: 351, column: 17, scope: !499)
!505 = !DILocation(line: 353, column: 41, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !64, line: 352, column: 17)
!507 = !DILocation(line: 353, column: 34, scope: !506)
!508 = !DILocation(line: 353, column: 21, scope: !506)
!509 = !DILocation(line: 354, column: 17, scope: !506)
!510 = !DILocation(line: 351, column: 37, scope: !502)
!511 = !DILocation(line: 351, column: 17, scope: !502)
!512 = distinct !{!512, !504, !513, !206}
!513 = !DILocation(line: 354, column: 17, scope: !499)
!514 = !DILocation(line: 355, column: 13, scope: !495)
!515 = !DILocation(line: 358, column: 17, scope: !516)
!516 = distinct !DILexicalBlock(scope: !491, file: !64, line: 357, column: 13)
!517 = !DILocation(line: 361, column: 5, scope: !486)
!518 = !DILocation(line: 362, column: 1, scope: !469)
!519 = distinct !DISubprogram(name: "goodG2B2", scope: !64, file: !64, line: 365, type: !73, scopeLine: 366, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!520 = !DILocalVariable(name: "data", scope: !519, file: !64, line: 367, type: !65)
!521 = !DILocation(line: 367, column: 9, scope: !519)
!522 = !DILocation(line: 369, column: 10, scope: !519)
!523 = !DILocation(line: 370, column: 8, scope: !524)
!524 = distinct !DILexicalBlock(scope: !519, file: !64, line: 370, column: 8)
!525 = !DILocation(line: 370, column: 8, scope: !519)
!526 = !DILocation(line: 374, column: 14, scope: !527)
!527 = distinct !DILexicalBlock(scope: !524, file: !64, line: 371, column: 5)
!528 = !DILocation(line: 375, column: 5, scope: !527)
!529 = !DILocation(line: 376, column: 8, scope: !530)
!530 = distinct !DILexicalBlock(scope: !519, file: !64, line: 376, column: 8)
!531 = !DILocation(line: 376, column: 8, scope: !519)
!532 = !DILocalVariable(name: "i", scope: !533, file: !64, line: 379, type: !65)
!533 = distinct !DILexicalBlock(scope: !534, file: !64, line: 378, column: 9)
!534 = distinct !DILexicalBlock(scope: !530, file: !64, line: 377, column: 5)
!535 = !DILocation(line: 379, column: 17, scope: !533)
!536 = !DILocalVariable(name: "buffer", scope: !533, file: !64, line: 380, type: !178)
!537 = !DILocation(line: 380, column: 17, scope: !533)
!538 = !DILocation(line: 383, column: 17, scope: !539)
!539 = distinct !DILexicalBlock(scope: !533, file: !64, line: 383, column: 17)
!540 = !DILocation(line: 383, column: 22, scope: !539)
!541 = !DILocation(line: 383, column: 17, scope: !533)
!542 = !DILocation(line: 385, column: 24, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !64, line: 384, column: 13)
!544 = !DILocation(line: 385, column: 17, scope: !543)
!545 = !DILocation(line: 385, column: 30, scope: !543)
!546 = !DILocation(line: 387, column: 23, scope: !547)
!547 = distinct !DILexicalBlock(scope: !543, file: !64, line: 387, column: 17)
!548 = !DILocation(line: 387, column: 21, scope: !547)
!549 = !DILocation(line: 387, column: 28, scope: !550)
!550 = distinct !DILexicalBlock(scope: !547, file: !64, line: 387, column: 17)
!551 = !DILocation(line: 387, column: 30, scope: !550)
!552 = !DILocation(line: 387, column: 17, scope: !547)
!553 = !DILocation(line: 389, column: 41, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !64, line: 388, column: 17)
!555 = !DILocation(line: 389, column: 34, scope: !554)
!556 = !DILocation(line: 389, column: 21, scope: !554)
!557 = !DILocation(line: 390, column: 17, scope: !554)
!558 = !DILocation(line: 387, column: 37, scope: !550)
!559 = !DILocation(line: 387, column: 17, scope: !550)
!560 = distinct !{!560, !552, !561, !206}
!561 = !DILocation(line: 390, column: 17, scope: !547)
!562 = !DILocation(line: 391, column: 13, scope: !543)
!563 = !DILocation(line: 394, column: 17, scope: !564)
!564 = distinct !DILexicalBlock(scope: !539, file: !64, line: 393, column: 13)
!565 = !DILocation(line: 397, column: 5, scope: !534)
!566 = !DILocation(line: 398, column: 1, scope: !519)
