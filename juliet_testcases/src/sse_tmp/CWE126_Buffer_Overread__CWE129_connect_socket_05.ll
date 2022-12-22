; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !62
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_05_bad() #0 !dbg !72 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  br i1 %tobool23, label %if.then24, label %if.end31, !dbg !172

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !173, metadata !DIExpression()), !dbg !179
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !179
  %13 = load i32, i32* %data, align 4, !dbg !180
  %cmp25 = icmp sge i32 %13, 0, !dbg !182
  br i1 %cmp25, label %if.then27, label %if.else, !dbg !183

if.then27:                                        ; preds = %if.then24
  %14 = load i32, i32* %data, align 4, !dbg !184
  %idxprom28 = sext i32 %14 to i64, !dbg !186
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !186
  %15 = load i32, i32* %arrayidx29, align 4, !dbg !186
  call void @printIntLine(i32 %15), !dbg !187
  br label %if.end30, !dbg !188

if.else:                                          ; preds = %if.then24
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !189
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then27
  br label %if.end31, !dbg !191

if.end31:                                         ; preds = %if.end30, %if.end22
  ret void, !dbg !192
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
define dso_local void @CWE126_Buffer_Overread__CWE129_connect_socket_05_good() #0 !dbg !193 {
entry:
  call void @goodB2G1(), !dbg !194
  call void @goodB2G2(), !dbg !195
  call void @goodG2B1(), !dbg !196
  call void @goodG2B2(), !dbg !197
  ret void, !dbg !198
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !199 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !206, metadata !DIExpression()), !dbg !207
  %call = call i64 @time(i64* null) #7, !dbg !208
  %conv = trunc i64 %call to i32, !dbg !209
  call void @srand(i32 %conv) #7, !dbg !210
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !211
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_05_good(), !dbg !212
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !213
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !214
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_05_bad(), !dbg !215
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !216
  ret i32 0, !dbg !217
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G1() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  %0 = load i32, i32* @staticTrue, align 4, !dbg !222
  %tobool = icmp ne i32 %0, 0, !dbg !222
  br i1 %tobool, label %if.then, label %if.end22, !dbg !224

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 -1, i32* %connectSocket, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !233, metadata !DIExpression()), !dbg !234
  br label %do.body, !dbg !235

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !236
  store i32 %call, i32* %connectSocket, align 4, !dbg !238
  %1 = load i32, i32* %connectSocket, align 4, !dbg !239
  %cmp = icmp eq i32 %1, -1, !dbg !241
  br i1 %cmp, label %if.then1, label %if.end, !dbg !242

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !243

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !245
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !246
  store i16 2, i16* %sin_family, align 4, !dbg !247
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !248
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !249
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !250
  store i32 %call2, i32* %s_addr, align 4, !dbg !251
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !252
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !253
  store i16 %call3, i16* %sin_port, align 2, !dbg !254
  %3 = load i32, i32* %connectSocket, align 4, !dbg !255
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !257
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !258
  %cmp5 = icmp eq i32 %call4, -1, !dbg !259
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !260

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !261

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !263
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !264
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !265
  %conv = trunc i64 %call8 to i32, !dbg !265
  store i32 %conv, i32* %recvResult, align 4, !dbg !266
  %6 = load i32, i32* %recvResult, align 4, !dbg !267
  %cmp9 = icmp eq i32 %6, -1, !dbg !269
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !270

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !271
  %cmp11 = icmp eq i32 %7, 0, !dbg !272
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !273

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !274

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !276
  %idxprom = sext i32 %8 to i64, !dbg !277
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !277
  store i8 0, i8* %arrayidx, align 1, !dbg !278
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !279
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !280
  store i32 %call16, i32* %data, align 4, !dbg !281
  br label %do.end, !dbg !282

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !283
  %cmp17 = icmp ne i32 %9, -1, !dbg !285
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !286

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !287
  %call20 = call i32 @close(i32 %10), !dbg !289
  br label %if.end21, !dbg !290

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !291

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticFalse, align 4, !dbg !292
  %tobool23 = icmp ne i32 %11, 0, !dbg !292
  br i1 %tobool23, label %if.then24, label %if.else, !dbg !294

if.then24:                                        ; preds = %if.end22
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !295
  br label %if.end34, !dbg !297

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !298, metadata !DIExpression()), !dbg !301
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !301
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !301
  %13 = load i32, i32* %data, align 4, !dbg !302
  %cmp25 = icmp sge i32 %13, 0, !dbg !304
  br i1 %cmp25, label %land.lhs.true, label %if.else32, !dbg !305

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !306
  %cmp27 = icmp slt i32 %14, 10, !dbg !307
  br i1 %cmp27, label %if.then29, label %if.else32, !dbg !308

if.then29:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !309
  %idxprom30 = sext i32 %15 to i64, !dbg !311
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !311
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !311
  call void @printIntLine(i32 %16), !dbg !312
  br label %if.end33, !dbg !313

if.else32:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !314
  br label %if.end33

if.end33:                                         ; preds = %if.else32, %if.then29
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %if.then24
  ret void, !dbg !316
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodB2G2() #0 !dbg !317 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !318, metadata !DIExpression()), !dbg !319
  store i32 -1, i32* %data, align 4, !dbg !320
  %0 = load i32, i32* @staticTrue, align 4, !dbg !321
  %tobool = icmp ne i32 %0, 0, !dbg !321
  br i1 %tobool, label %if.then, label %if.end22, !dbg !323

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !324, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !330, metadata !DIExpression()), !dbg !331
  store i32 -1, i32* %connectSocket, align 4, !dbg !331
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !332, metadata !DIExpression()), !dbg !333
  br label %do.body, !dbg !334

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 2, i32 1, i32 6) #7, !dbg !335
  store i32 %call, i32* %connectSocket, align 4, !dbg !337
  %1 = load i32, i32* %connectSocket, align 4, !dbg !338
  %cmp = icmp eq i32 %1, -1, !dbg !340
  br i1 %cmp, label %if.then1, label %if.end, !dbg !341

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !342

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !344
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !344
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 0, !dbg !345
  store i16 2, i16* %sin_family, align 4, !dbg !346
  %call2 = call i32 @inet_addr(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)) #7, !dbg !347
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !348
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !349
  store i32 %call2, i32* %s_addr, align 4, !dbg !350
  %call3 = call zeroext i16 @htons(i16 zeroext 27015) #8, !dbg !351
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !352
  store i16 %call3, i16* %sin_port, align 2, !dbg !353
  %3 = load i32, i32* %connectSocket, align 4, !dbg !354
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !356
  %call4 = call i32 @connect(i32 %3, %struct.sockaddr* %4, i32 16), !dbg !357
  %cmp5 = icmp eq i32 %call4, -1, !dbg !358
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !359

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !360

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !362
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !363
  %call8 = call i64 @recv(i32 %5, i8* %arraydecay, i64 13, i32 0), !dbg !364
  %conv = trunc i64 %call8 to i32, !dbg !364
  store i32 %conv, i32* %recvResult, align 4, !dbg !365
  %6 = load i32, i32* %recvResult, align 4, !dbg !366
  %cmp9 = icmp eq i32 %6, -1, !dbg !368
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !369

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !370
  %cmp11 = icmp eq i32 %7, 0, !dbg !371
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !372

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !373

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !375
  %idxprom = sext i32 %8 to i64, !dbg !376
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !376
  store i8 0, i8* %arrayidx, align 1, !dbg !377
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !378
  %call16 = call i32 @atoi(i8* %arraydecay15) #9, !dbg !379
  store i32 %call16, i32* %data, align 4, !dbg !380
  br label %do.end, !dbg !381

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !382
  %cmp17 = icmp ne i32 %9, -1, !dbg !384
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !385

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !386
  %call20 = call i32 @close(i32 %10), !dbg !388
  br label %if.end21, !dbg !389

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !390

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !391
  %tobool23 = icmp ne i32 %11, 0, !dbg !391
  br i1 %tobool23, label %if.then24, label %if.end33, !dbg !393

if.then24:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !394, metadata !DIExpression()), !dbg !397
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !397
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !397
  %13 = load i32, i32* %data, align 4, !dbg !398
  %cmp25 = icmp sge i32 %13, 0, !dbg !400
  br i1 %cmp25, label %land.lhs.true, label %if.else, !dbg !401

land.lhs.true:                                    ; preds = %if.then24
  %14 = load i32, i32* %data, align 4, !dbg !402
  %cmp27 = icmp slt i32 %14, 10, !dbg !403
  br i1 %cmp27, label %if.then29, label %if.else, !dbg !404

if.then29:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !405
  %idxprom30 = sext i32 %15 to i64, !dbg !407
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !407
  %16 = load i32, i32* %arrayidx31, align 4, !dbg !407
  call void @printIntLine(i32 %16), !dbg !408
  br label %if.end32, !dbg !409

if.else:                                          ; preds = %land.lhs.true, %if.then24
  call void @printLine(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !410
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then29
  br label %if.end33, !dbg !412

if.end33:                                         ; preds = %if.end32, %if.end22
  ret void, !dbg !413
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !414 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !415, metadata !DIExpression()), !dbg !416
  store i32 -1, i32* %data, align 4, !dbg !417
  %0 = load i32, i32* @staticFalse, align 4, !dbg !418
  %tobool = icmp ne i32 %0, 0, !dbg !418
  br i1 %tobool, label %if.then, label %if.else, !dbg !420

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !421
  br label %if.end, !dbg !423

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !424
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !426
  %tobool1 = icmp ne i32 %1, 0, !dbg !426
  br i1 %tobool1, label %if.then2, label %if.end6, !dbg !428

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !429, metadata !DIExpression()), !dbg !432
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !432
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !432
  %3 = load i32, i32* %data, align 4, !dbg !433
  %cmp = icmp sge i32 %3, 0, !dbg !435
  br i1 %cmp, label %if.then3, label %if.else4, !dbg !436

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !437
  %idxprom = sext i32 %4 to i64, !dbg !439
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !439
  %5 = load i32, i32* %arrayidx, align 4, !dbg !439
  call void @printIntLine(i32 %5), !dbg !440
  br label %if.end5, !dbg !441

if.else4:                                         ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !442
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then3
  br label %if.end6, !dbg !444

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !445
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !446 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !447, metadata !DIExpression()), !dbg !448
  store i32 -1, i32* %data, align 4, !dbg !449
  %0 = load i32, i32* @staticTrue, align 4, !dbg !450
  %tobool = icmp ne i32 %0, 0, !dbg !450
  br i1 %tobool, label %if.then, label %if.end, !dbg !452

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !453
  br label %if.end, !dbg !455

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !456
  %tobool1 = icmp ne i32 %1, 0, !dbg !456
  br i1 %tobool1, label %if.then2, label %if.end5, !dbg !458

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !459, metadata !DIExpression()), !dbg !462
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !462
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !462
  %3 = load i32, i32* %data, align 4, !dbg !463
  %cmp = icmp sge i32 %3, 0, !dbg !465
  br i1 %cmp, label %if.then3, label %if.else, !dbg !466

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !467
  %idxprom = sext i32 %4 to i64, !dbg !469
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !469
  %5 = load i32, i32* %arrayidx, align 4, !dbg !469
  call void @printIntLine(i32 %5), !dbg !470
  br label %if.end4, !dbg !471

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !472
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then3
  br label %if.end5, !dbg !474

if.end5:                                          ; preds = %if.end4, %if.end
  ret void, !dbg !475
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_05.c", directory: "/root/SSE-Assessment")
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
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !50, line: 175, size: 128, elements: !51)
!50 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/socket.h", directory: "")
!51 = !{!52, !56}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !49, file: !50, line: 177, baseType: !53, size: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !54, line: 28, baseType: !55)
!54 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/sockaddr.h", directory: "")
!55 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !49, file: !50, line: 178, baseType: !57, size: 112, offset: 16)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 112, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 14)
!61 = !{!0, !62}
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !64, line: 46, type: !65, isLocal: true, isDefinition: true)
!64 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE129_connect_socket_05.c", directory: "/root/SSE-Assessment")
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !{i32 7, !"Dwarf Version", i32 4}
!67 = !{i32 2, !"Debug Info Version", i32 3}
!68 = !{i32 1, !"wchar_size", i32 4}
!69 = !{i32 7, !"uwtable", i32 1}
!70 = !{i32 7, !"frame-pointer", i32 2}
!71 = !{!"clang version 13.0.0"}
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_05_bad", scope: !64, file: !64, line: 50, type: !73, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
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
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !19, line: 237, size: 128, elements: !88)
!88 = !{!89, !90, !96, !103}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !87, file: !19, line: 239, baseType: !53, size: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !87, file: !19, line: 240, baseType: !91, size: 16, offset: 16)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !19, line: 119, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !93, line: 25, baseType: !94)
!93 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !95, line: 39, baseType: !55)
!95 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!96 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !87, file: !19, line: 241, baseType: !97, size: 32, offset: 32)
!97 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !19, line: 31, size: 32, elements: !98)
!98 = !{!99}
!99 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !97, file: !19, line: 33, baseType: !100, size: 32)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !19, line: 30, baseType: !101)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !93, line: 26, baseType: !102)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !95, line: 41, baseType: !7)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !87, file: !19, line: 244, baseType: !104, size: 64, offset: 64)
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
!173 = !DILocalVariable(name: "buffer", scope: !174, file: !64, line: 117, type: !176)
!174 = distinct !DILexicalBlock(scope: !175, file: !64, line: 116, column: 9)
!175 = distinct !DILexicalBlock(scope: !171, file: !64, line: 115, column: 5)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 320, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 10)
!179 = !DILocation(line: 117, column: 17, scope: !174)
!180 = !DILocation(line: 120, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !174, file: !64, line: 120, column: 17)
!182 = !DILocation(line: 120, column: 22, scope: !181)
!183 = !DILocation(line: 120, column: 17, scope: !174)
!184 = !DILocation(line: 122, column: 37, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !64, line: 121, column: 13)
!186 = !DILocation(line: 122, column: 30, scope: !185)
!187 = !DILocation(line: 122, column: 17, scope: !185)
!188 = !DILocation(line: 123, column: 13, scope: !185)
!189 = !DILocation(line: 126, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !181, file: !64, line: 125, column: 13)
!191 = !DILocation(line: 129, column: 5, scope: !175)
!192 = !DILocation(line: 130, column: 1, scope: !72)
!193 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_05_good", scope: !64, file: !64, line: 370, type: !73, scopeLine: 371, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!194 = !DILocation(line: 372, column: 5, scope: !193)
!195 = !DILocation(line: 373, column: 5, scope: !193)
!196 = !DILocation(line: 374, column: 5, scope: !193)
!197 = !DILocation(line: 375, column: 5, scope: !193)
!198 = !DILocation(line: 376, column: 1, scope: !193)
!199 = distinct !DISubprogram(name: "main", scope: !64, file: !64, line: 387, type: !200, scopeLine: 388, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !75)
!200 = !DISubroutineType(types: !201)
!201 = !{!65, !65, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!204 = !DILocalVariable(name: "argc", arg: 1, scope: !199, file: !64, line: 387, type: !65)
!205 = !DILocation(line: 387, column: 14, scope: !199)
!206 = !DILocalVariable(name: "argv", arg: 2, scope: !199, file: !64, line: 387, type: !202)
!207 = !DILocation(line: 387, column: 27, scope: !199)
!208 = !DILocation(line: 390, column: 22, scope: !199)
!209 = !DILocation(line: 390, column: 12, scope: !199)
!210 = !DILocation(line: 390, column: 5, scope: !199)
!211 = !DILocation(line: 392, column: 5, scope: !199)
!212 = !DILocation(line: 393, column: 5, scope: !199)
!213 = !DILocation(line: 394, column: 5, scope: !199)
!214 = !DILocation(line: 397, column: 5, scope: !199)
!215 = !DILocation(line: 398, column: 5, scope: !199)
!216 = !DILocation(line: 399, column: 5, scope: !199)
!217 = !DILocation(line: 401, column: 5, scope: !199)
!218 = distinct !DISubprogram(name: "goodB2G1", scope: !64, file: !64, line: 137, type: !73, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!219 = !DILocalVariable(name: "data", scope: !218, file: !64, line: 139, type: !65)
!220 = !DILocation(line: 139, column: 9, scope: !218)
!221 = !DILocation(line: 141, column: 10, scope: !218)
!222 = !DILocation(line: 142, column: 8, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !64, line: 142, column: 8)
!224 = !DILocation(line: 142, column: 8, scope: !218)
!225 = !DILocalVariable(name: "recvResult", scope: !226, file: !64, line: 149, type: !65)
!226 = distinct !DILexicalBlock(scope: !227, file: !64, line: 144, column: 9)
!227 = distinct !DILexicalBlock(scope: !223, file: !64, line: 143, column: 5)
!228 = !DILocation(line: 149, column: 17, scope: !226)
!229 = !DILocalVariable(name: "service", scope: !226, file: !64, line: 150, type: !87)
!230 = !DILocation(line: 150, column: 32, scope: !226)
!231 = !DILocalVariable(name: "connectSocket", scope: !226, file: !64, line: 151, type: !65)
!232 = !DILocation(line: 151, column: 20, scope: !226)
!233 = !DILocalVariable(name: "inputBuffer", scope: !226, file: !64, line: 152, type: !57)
!234 = !DILocation(line: 152, column: 18, scope: !226)
!235 = !DILocation(line: 153, column: 13, scope: !226)
!236 = !DILocation(line: 163, column: 33, scope: !237)
!237 = distinct !DILexicalBlock(scope: !226, file: !64, line: 154, column: 13)
!238 = !DILocation(line: 163, column: 31, scope: !237)
!239 = !DILocation(line: 164, column: 21, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !64, line: 164, column: 21)
!241 = !DILocation(line: 164, column: 35, scope: !240)
!242 = !DILocation(line: 164, column: 21, scope: !237)
!243 = !DILocation(line: 166, column: 21, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !64, line: 165, column: 17)
!245 = !DILocation(line: 168, column: 17, scope: !237)
!246 = !DILocation(line: 169, column: 25, scope: !237)
!247 = !DILocation(line: 169, column: 36, scope: !237)
!248 = !DILocation(line: 170, column: 43, scope: !237)
!249 = !DILocation(line: 170, column: 25, scope: !237)
!250 = !DILocation(line: 170, column: 34, scope: !237)
!251 = !DILocation(line: 170, column: 41, scope: !237)
!252 = !DILocation(line: 171, column: 36, scope: !237)
!253 = !DILocation(line: 171, column: 25, scope: !237)
!254 = !DILocation(line: 171, column: 34, scope: !237)
!255 = !DILocation(line: 172, column: 29, scope: !256)
!256 = distinct !DILexicalBlock(scope: !237, file: !64, line: 172, column: 21)
!257 = !DILocation(line: 172, column: 44, scope: !256)
!258 = !DILocation(line: 172, column: 21, scope: !256)
!259 = !DILocation(line: 172, column: 89, scope: !256)
!260 = !DILocation(line: 172, column: 21, scope: !237)
!261 = !DILocation(line: 174, column: 21, scope: !262)
!262 = distinct !DILexicalBlock(scope: !256, file: !64, line: 173, column: 17)
!263 = !DILocation(line: 178, column: 35, scope: !237)
!264 = !DILocation(line: 178, column: 50, scope: !237)
!265 = !DILocation(line: 178, column: 30, scope: !237)
!266 = !DILocation(line: 178, column: 28, scope: !237)
!267 = !DILocation(line: 179, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !237, file: !64, line: 179, column: 21)
!269 = !DILocation(line: 179, column: 32, scope: !268)
!270 = !DILocation(line: 179, column: 48, scope: !268)
!271 = !DILocation(line: 179, column: 51, scope: !268)
!272 = !DILocation(line: 179, column: 62, scope: !268)
!273 = !DILocation(line: 179, column: 21, scope: !237)
!274 = !DILocation(line: 181, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !268, file: !64, line: 180, column: 17)
!276 = !DILocation(line: 184, column: 29, scope: !237)
!277 = !DILocation(line: 184, column: 17, scope: !237)
!278 = !DILocation(line: 184, column: 41, scope: !237)
!279 = !DILocation(line: 186, column: 29, scope: !237)
!280 = !DILocation(line: 186, column: 24, scope: !237)
!281 = !DILocation(line: 186, column: 22, scope: !237)
!282 = !DILocation(line: 187, column: 13, scope: !237)
!283 = !DILocation(line: 189, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !226, file: !64, line: 189, column: 17)
!285 = !DILocation(line: 189, column: 31, scope: !284)
!286 = !DILocation(line: 189, column: 17, scope: !226)
!287 = !DILocation(line: 191, column: 30, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !64, line: 190, column: 13)
!289 = !DILocation(line: 191, column: 17, scope: !288)
!290 = !DILocation(line: 192, column: 13, scope: !288)
!291 = !DILocation(line: 200, column: 5, scope: !227)
!292 = !DILocation(line: 201, column: 8, scope: !293)
!293 = distinct !DILexicalBlock(scope: !218, file: !64, line: 201, column: 8)
!294 = !DILocation(line: 201, column: 8, scope: !218)
!295 = !DILocation(line: 204, column: 9, scope: !296)
!296 = distinct !DILexicalBlock(scope: !293, file: !64, line: 202, column: 5)
!297 = !DILocation(line: 205, column: 5, scope: !296)
!298 = !DILocalVariable(name: "buffer", scope: !299, file: !64, line: 209, type: !176)
!299 = distinct !DILexicalBlock(scope: !300, file: !64, line: 208, column: 9)
!300 = distinct !DILexicalBlock(scope: !293, file: !64, line: 207, column: 5)
!301 = !DILocation(line: 209, column: 17, scope: !299)
!302 = !DILocation(line: 211, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !64, line: 211, column: 17)
!304 = !DILocation(line: 211, column: 22, scope: !303)
!305 = !DILocation(line: 211, column: 27, scope: !303)
!306 = !DILocation(line: 211, column: 30, scope: !303)
!307 = !DILocation(line: 211, column: 35, scope: !303)
!308 = !DILocation(line: 211, column: 17, scope: !299)
!309 = !DILocation(line: 213, column: 37, scope: !310)
!310 = distinct !DILexicalBlock(scope: !303, file: !64, line: 212, column: 13)
!311 = !DILocation(line: 213, column: 30, scope: !310)
!312 = !DILocation(line: 213, column: 17, scope: !310)
!313 = !DILocation(line: 214, column: 13, scope: !310)
!314 = !DILocation(line: 217, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !303, file: !64, line: 216, column: 13)
!316 = !DILocation(line: 221, column: 1, scope: !218)
!317 = distinct !DISubprogram(name: "goodB2G2", scope: !64, file: !64, line: 224, type: !73, scopeLine: 225, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!318 = !DILocalVariable(name: "data", scope: !317, file: !64, line: 226, type: !65)
!319 = !DILocation(line: 226, column: 9, scope: !317)
!320 = !DILocation(line: 228, column: 10, scope: !317)
!321 = !DILocation(line: 229, column: 8, scope: !322)
!322 = distinct !DILexicalBlock(scope: !317, file: !64, line: 229, column: 8)
!323 = !DILocation(line: 229, column: 8, scope: !317)
!324 = !DILocalVariable(name: "recvResult", scope: !325, file: !64, line: 236, type: !65)
!325 = distinct !DILexicalBlock(scope: !326, file: !64, line: 231, column: 9)
!326 = distinct !DILexicalBlock(scope: !322, file: !64, line: 230, column: 5)
!327 = !DILocation(line: 236, column: 17, scope: !325)
!328 = !DILocalVariable(name: "service", scope: !325, file: !64, line: 237, type: !87)
!329 = !DILocation(line: 237, column: 32, scope: !325)
!330 = !DILocalVariable(name: "connectSocket", scope: !325, file: !64, line: 238, type: !65)
!331 = !DILocation(line: 238, column: 20, scope: !325)
!332 = !DILocalVariable(name: "inputBuffer", scope: !325, file: !64, line: 239, type: !57)
!333 = !DILocation(line: 239, column: 18, scope: !325)
!334 = !DILocation(line: 240, column: 13, scope: !325)
!335 = !DILocation(line: 250, column: 33, scope: !336)
!336 = distinct !DILexicalBlock(scope: !325, file: !64, line: 241, column: 13)
!337 = !DILocation(line: 250, column: 31, scope: !336)
!338 = !DILocation(line: 251, column: 21, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !64, line: 251, column: 21)
!340 = !DILocation(line: 251, column: 35, scope: !339)
!341 = !DILocation(line: 251, column: 21, scope: !336)
!342 = !DILocation(line: 253, column: 21, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !64, line: 252, column: 17)
!344 = !DILocation(line: 255, column: 17, scope: !336)
!345 = !DILocation(line: 256, column: 25, scope: !336)
!346 = !DILocation(line: 256, column: 36, scope: !336)
!347 = !DILocation(line: 257, column: 43, scope: !336)
!348 = !DILocation(line: 257, column: 25, scope: !336)
!349 = !DILocation(line: 257, column: 34, scope: !336)
!350 = !DILocation(line: 257, column: 41, scope: !336)
!351 = !DILocation(line: 258, column: 36, scope: !336)
!352 = !DILocation(line: 258, column: 25, scope: !336)
!353 = !DILocation(line: 258, column: 34, scope: !336)
!354 = !DILocation(line: 259, column: 29, scope: !355)
!355 = distinct !DILexicalBlock(scope: !336, file: !64, line: 259, column: 21)
!356 = !DILocation(line: 259, column: 44, scope: !355)
!357 = !DILocation(line: 259, column: 21, scope: !355)
!358 = !DILocation(line: 259, column: 89, scope: !355)
!359 = !DILocation(line: 259, column: 21, scope: !336)
!360 = !DILocation(line: 261, column: 21, scope: !361)
!361 = distinct !DILexicalBlock(scope: !355, file: !64, line: 260, column: 17)
!362 = !DILocation(line: 265, column: 35, scope: !336)
!363 = !DILocation(line: 265, column: 50, scope: !336)
!364 = !DILocation(line: 265, column: 30, scope: !336)
!365 = !DILocation(line: 265, column: 28, scope: !336)
!366 = !DILocation(line: 266, column: 21, scope: !367)
!367 = distinct !DILexicalBlock(scope: !336, file: !64, line: 266, column: 21)
!368 = !DILocation(line: 266, column: 32, scope: !367)
!369 = !DILocation(line: 266, column: 48, scope: !367)
!370 = !DILocation(line: 266, column: 51, scope: !367)
!371 = !DILocation(line: 266, column: 62, scope: !367)
!372 = !DILocation(line: 266, column: 21, scope: !336)
!373 = !DILocation(line: 268, column: 21, scope: !374)
!374 = distinct !DILexicalBlock(scope: !367, file: !64, line: 267, column: 17)
!375 = !DILocation(line: 271, column: 29, scope: !336)
!376 = !DILocation(line: 271, column: 17, scope: !336)
!377 = !DILocation(line: 271, column: 41, scope: !336)
!378 = !DILocation(line: 273, column: 29, scope: !336)
!379 = !DILocation(line: 273, column: 24, scope: !336)
!380 = !DILocation(line: 273, column: 22, scope: !336)
!381 = !DILocation(line: 274, column: 13, scope: !336)
!382 = !DILocation(line: 276, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !325, file: !64, line: 276, column: 17)
!384 = !DILocation(line: 276, column: 31, scope: !383)
!385 = !DILocation(line: 276, column: 17, scope: !325)
!386 = !DILocation(line: 278, column: 30, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !64, line: 277, column: 13)
!388 = !DILocation(line: 278, column: 17, scope: !387)
!389 = !DILocation(line: 279, column: 13, scope: !387)
!390 = !DILocation(line: 287, column: 5, scope: !326)
!391 = !DILocation(line: 288, column: 8, scope: !392)
!392 = distinct !DILexicalBlock(scope: !317, file: !64, line: 288, column: 8)
!393 = !DILocation(line: 288, column: 8, scope: !317)
!394 = !DILocalVariable(name: "buffer", scope: !395, file: !64, line: 291, type: !176)
!395 = distinct !DILexicalBlock(scope: !396, file: !64, line: 290, column: 9)
!396 = distinct !DILexicalBlock(scope: !392, file: !64, line: 289, column: 5)
!397 = !DILocation(line: 291, column: 17, scope: !395)
!398 = !DILocation(line: 293, column: 17, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !64, line: 293, column: 17)
!400 = !DILocation(line: 293, column: 22, scope: !399)
!401 = !DILocation(line: 293, column: 27, scope: !399)
!402 = !DILocation(line: 293, column: 30, scope: !399)
!403 = !DILocation(line: 293, column: 35, scope: !399)
!404 = !DILocation(line: 293, column: 17, scope: !395)
!405 = !DILocation(line: 295, column: 37, scope: !406)
!406 = distinct !DILexicalBlock(scope: !399, file: !64, line: 294, column: 13)
!407 = !DILocation(line: 295, column: 30, scope: !406)
!408 = !DILocation(line: 295, column: 17, scope: !406)
!409 = !DILocation(line: 296, column: 13, scope: !406)
!410 = !DILocation(line: 299, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !399, file: !64, line: 298, column: 13)
!412 = !DILocation(line: 302, column: 5, scope: !396)
!413 = !DILocation(line: 303, column: 1, scope: !317)
!414 = distinct !DISubprogram(name: "goodG2B1", scope: !64, file: !64, line: 306, type: !73, scopeLine: 307, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!415 = !DILocalVariable(name: "data", scope: !414, file: !64, line: 308, type: !65)
!416 = !DILocation(line: 308, column: 9, scope: !414)
!417 = !DILocation(line: 310, column: 10, scope: !414)
!418 = !DILocation(line: 311, column: 8, scope: !419)
!419 = distinct !DILexicalBlock(scope: !414, file: !64, line: 311, column: 8)
!420 = !DILocation(line: 311, column: 8, scope: !414)
!421 = !DILocation(line: 314, column: 9, scope: !422)
!422 = distinct !DILexicalBlock(scope: !419, file: !64, line: 312, column: 5)
!423 = !DILocation(line: 315, column: 5, scope: !422)
!424 = !DILocation(line: 320, column: 14, scope: !425)
!425 = distinct !DILexicalBlock(scope: !419, file: !64, line: 317, column: 5)
!426 = !DILocation(line: 322, column: 8, scope: !427)
!427 = distinct !DILexicalBlock(scope: !414, file: !64, line: 322, column: 8)
!428 = !DILocation(line: 322, column: 8, scope: !414)
!429 = !DILocalVariable(name: "buffer", scope: !430, file: !64, line: 325, type: !176)
!430 = distinct !DILexicalBlock(scope: !431, file: !64, line: 324, column: 9)
!431 = distinct !DILexicalBlock(scope: !427, file: !64, line: 323, column: 5)
!432 = !DILocation(line: 325, column: 17, scope: !430)
!433 = !DILocation(line: 328, column: 17, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !64, line: 328, column: 17)
!435 = !DILocation(line: 328, column: 22, scope: !434)
!436 = !DILocation(line: 328, column: 17, scope: !430)
!437 = !DILocation(line: 330, column: 37, scope: !438)
!438 = distinct !DILexicalBlock(scope: !434, file: !64, line: 329, column: 13)
!439 = !DILocation(line: 330, column: 30, scope: !438)
!440 = !DILocation(line: 330, column: 17, scope: !438)
!441 = !DILocation(line: 331, column: 13, scope: !438)
!442 = !DILocation(line: 334, column: 17, scope: !443)
!443 = distinct !DILexicalBlock(scope: !434, file: !64, line: 333, column: 13)
!444 = !DILocation(line: 337, column: 5, scope: !431)
!445 = !DILocation(line: 338, column: 1, scope: !414)
!446 = distinct !DISubprogram(name: "goodG2B2", scope: !64, file: !64, line: 341, type: !73, scopeLine: 342, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !75)
!447 = !DILocalVariable(name: "data", scope: !446, file: !64, line: 343, type: !65)
!448 = !DILocation(line: 343, column: 9, scope: !446)
!449 = !DILocation(line: 345, column: 10, scope: !446)
!450 = !DILocation(line: 346, column: 8, scope: !451)
!451 = distinct !DILexicalBlock(scope: !446, file: !64, line: 346, column: 8)
!452 = !DILocation(line: 346, column: 8, scope: !446)
!453 = !DILocation(line: 350, column: 14, scope: !454)
!454 = distinct !DILexicalBlock(scope: !451, file: !64, line: 347, column: 5)
!455 = !DILocation(line: 351, column: 5, scope: !454)
!456 = !DILocation(line: 352, column: 8, scope: !457)
!457 = distinct !DILexicalBlock(scope: !446, file: !64, line: 352, column: 8)
!458 = !DILocation(line: 352, column: 8, scope: !446)
!459 = !DILocalVariable(name: "buffer", scope: !460, file: !64, line: 355, type: !176)
!460 = distinct !DILexicalBlock(scope: !461, file: !64, line: 354, column: 9)
!461 = distinct !DILexicalBlock(scope: !457, file: !64, line: 353, column: 5)
!462 = !DILocation(line: 355, column: 17, scope: !460)
!463 = !DILocation(line: 358, column: 17, scope: !464)
!464 = distinct !DILexicalBlock(scope: !460, file: !64, line: 358, column: 17)
!465 = !DILocation(line: 358, column: 22, scope: !464)
!466 = !DILocation(line: 358, column: 17, scope: !460)
!467 = !DILocation(line: 360, column: 37, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !64, line: 359, column: 13)
!469 = !DILocation(line: 360, column: 30, scope: !468)
!470 = !DILocation(line: 360, column: 17, scope: !468)
!471 = !DILocation(line: 361, column: 13, scope: !468)
!472 = !DILocation(line: 364, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !464, file: !64, line: 363, column: 13)
!474 = !DILocation(line: 367, column: 5, scope: !461)
!475 = !DILocation(line: 368, column: 1, scope: !446)
