; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !32
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !36
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !37
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !37
  store i8 0, i8* %arrayidx1, align 1, !dbg !38
  %6 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %6, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataBadBuffer, align 8, !dbg !42
  store i8* %7, i8** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx2, align 1, !dbg !61
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !63
  store i64 %call, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !68
  %9 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp = icmp ult i64 %8, %9, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !73
  %11 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !73
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !73
  %13 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !77
  store i8 %12, i8* %arrayidx5, align 1, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %14, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx6, align 1, !dbg !86
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  call void @printLine(i8* %arraydecay7), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_05_good() #0 !dbg !90 {
entry:
  call void @goodG2B1(), !dbg !91
  call void @goodG2B2(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__char_alloca_loop_05_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__char_alloca_loop_05_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 50, align 16, !dbg !117
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = alloca i8, i64 100, align 16, !dbg !120
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !119
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !122
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !126
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !127
  store i8 0, i8* %arrayidx1, align 1, !dbg !128
  %6 = load i32, i32* @staticFalse, align 4, !dbg !129
  %tobool = icmp ne i32 %6, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !132
  br label %if.end, !dbg !134

if.else:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !135
  store i8* %7, i8** %data, align 8, !dbg !137
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !145
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !146
  store i8 0, i8* %arrayidx2, align 1, !dbg !147
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !149
  store i64 %call, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !154
  %9 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp = icmp ult i64 %8, %9, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !159
  %11 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !159
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !159
  %13 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !163
  store i8 %12, i8* %arrayidx5, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %14, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx6, align 1, !dbg !171
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !172
  call void @printLine(i8* %arraydecay7), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !175 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  %0 = alloca i8, i64 50, align 16, !dbg !180
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  %1 = alloca i8, i64 100, align 16, !dbg !183
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !182
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !185
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !186
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !186
  store i8 0, i8* %arrayidx, align 1, !dbg !187
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !189
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !190
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !190
  store i8 0, i8* %arrayidx1, align 1, !dbg !191
  %6 = load i32, i32* @staticTrue, align 4, !dbg !192
  %tobool = icmp ne i32 %6, 0, !dbg !192
  br i1 %tobool, label %if.then, label %if.end, !dbg !194

if.then:                                          ; preds = %entry
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !195
  store i8* %7, i8** %data, align 8, !dbg !197
  br label %if.end, !dbg !198

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !199, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !204, metadata !DIExpression()), !dbg !205
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !206
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !206
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !207
  store i8 0, i8* %arrayidx2, align 1, !dbg !208
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !209
  %call = call i64 @strlen(i8* %arraydecay3) #6, !dbg !210
  store i64 %call, i64* %destLen, align 8, !dbg !211
  store i64 0, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !215
  %9 = load i64, i64* %destLen, align 8, !dbg !217
  %cmp = icmp ult i64 %8, %9, !dbg !218
  br i1 %cmp, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !220
  %11 = load i64, i64* %i, align 8, !dbg !222
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !220
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !220
  %13 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %13, !dbg !224
  store i8 %12, i8* %arrayidx5, align 1, !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !227
  %inc = add i64 %14, 1, !dbg !227
  store i64 %inc, i64* %i, align 8, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !231
  store i8 0, i8* %arrayidx6, align 1, !dbg !232
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !233
  call void @printLine(i8* %arraydecay7), !dbg !234
  ret void, !dbg !235
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 34, type: !6)
!29 = !DILocation(line: 34, column: 12, scope: !20)
!30 = !DILocation(line: 34, column: 37, scope: !20)
!31 = !DILocation(line: 35, column: 12, scope: !20)
!32 = !DILocation(line: 35, column: 5, scope: !20)
!33 = !DILocation(line: 36, column: 5, scope: !20)
!34 = !DILocation(line: 36, column: 25, scope: !20)
!35 = !DILocation(line: 37, column: 12, scope: !20)
!36 = !DILocation(line: 37, column: 5, scope: !20)
!37 = !DILocation(line: 38, column: 5, scope: !20)
!38 = !DILocation(line: 38, column: 27, scope: !20)
!39 = !DILocation(line: 39, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !20, file: !12, line: 39, column: 8)
!41 = !DILocation(line: 39, column: 8, scope: !20)
!42 = !DILocation(line: 42, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !12, line: 40, column: 5)
!44 = !DILocation(line: 42, column: 14, scope: !43)
!45 = !DILocation(line: 43, column: 5, scope: !43)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 45, type: !48)
!47 = distinct !DILexicalBlock(scope: !20, file: !12, line: 44, column: 5)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 46, baseType: !50)
!49 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!50 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 45, column: 16, scope: !47)
!52 = !DILocalVariable(name: "destLen", scope: !47, file: !12, line: 45, type: !48)
!53 = !DILocation(line: 45, column: 19, scope: !47)
!54 = !DILocalVariable(name: "dest", scope: !47, file: !12, line: 46, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 46, column: 14, scope: !47)
!59 = !DILocation(line: 47, column: 9, scope: !47)
!60 = !DILocation(line: 48, column: 9, scope: !47)
!61 = !DILocation(line: 48, column: 21, scope: !47)
!62 = !DILocation(line: 49, column: 26, scope: !47)
!63 = !DILocation(line: 49, column: 19, scope: !47)
!64 = !DILocation(line: 49, column: 17, scope: !47)
!65 = !DILocation(line: 52, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !47, file: !12, line: 52, column: 9)
!67 = !DILocation(line: 52, column: 14, scope: !66)
!68 = !DILocation(line: 52, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 52, column: 9)
!70 = !DILocation(line: 52, column: 25, scope: !69)
!71 = !DILocation(line: 52, column: 23, scope: !69)
!72 = !DILocation(line: 52, column: 9, scope: !66)
!73 = !DILocation(line: 54, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !12, line: 53, column: 9)
!75 = !DILocation(line: 54, column: 28, scope: !74)
!76 = !DILocation(line: 54, column: 18, scope: !74)
!77 = !DILocation(line: 54, column: 13, scope: !74)
!78 = !DILocation(line: 54, column: 21, scope: !74)
!79 = !DILocation(line: 55, column: 9, scope: !74)
!80 = !DILocation(line: 52, column: 35, scope: !69)
!81 = !DILocation(line: 52, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 55, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 56, column: 9, scope: !47)
!86 = !DILocation(line: 56, column: 21, scope: !47)
!87 = !DILocation(line: 57, column: 19, scope: !47)
!88 = !DILocation(line: 57, column: 9, scope: !47)
!89 = !DILocation(line: 59, column: 1, scope: !20)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_05_good", scope: !12, file: !12, line: 134, type: !21, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 136, column: 5, scope: !90)
!92 = !DILocation(line: 137, column: 5, scope: !90)
!93 = !DILocation(line: 138, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 150, type: !95, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DISubroutineType(types: !96)
!96 = !{!13, !13, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !12, line: 150, type: !13)
!99 = !DILocation(line: 150, column: 14, scope: !94)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !12, line: 150, type: !97)
!101 = !DILocation(line: 150, column: 27, scope: !94)
!102 = !DILocation(line: 153, column: 22, scope: !94)
!103 = !DILocation(line: 153, column: 12, scope: !94)
!104 = !DILocation(line: 153, column: 5, scope: !94)
!105 = !DILocation(line: 155, column: 5, scope: !94)
!106 = !DILocation(line: 156, column: 5, scope: !94)
!107 = !DILocation(line: 157, column: 5, scope: !94)
!108 = !DILocation(line: 160, column: 5, scope: !94)
!109 = !DILocation(line: 161, column: 5, scope: !94)
!110 = !DILocation(line: 162, column: 5, scope: !94)
!111 = !DILocation(line: 164, column: 5, scope: !94)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 68, type: !6)
!114 = !DILocation(line: 68, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 69, type: !6)
!116 = !DILocation(line: 69, column: 12, scope: !112)
!117 = !DILocation(line: 69, column: 36, scope: !112)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 70, type: !6)
!119 = !DILocation(line: 70, column: 12, scope: !112)
!120 = !DILocation(line: 70, column: 37, scope: !112)
!121 = !DILocation(line: 71, column: 12, scope: !112)
!122 = !DILocation(line: 71, column: 5, scope: !112)
!123 = !DILocation(line: 72, column: 5, scope: !112)
!124 = !DILocation(line: 72, column: 25, scope: !112)
!125 = !DILocation(line: 73, column: 12, scope: !112)
!126 = !DILocation(line: 73, column: 5, scope: !112)
!127 = !DILocation(line: 74, column: 5, scope: !112)
!128 = !DILocation(line: 74, column: 27, scope: !112)
!129 = !DILocation(line: 75, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !112, file: !12, line: 75, column: 8)
!131 = !DILocation(line: 75, column: 8, scope: !112)
!132 = !DILocation(line: 78, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 76, column: 5)
!134 = !DILocation(line: 79, column: 5, scope: !133)
!135 = !DILocation(line: 83, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !12, line: 81, column: 5)
!137 = !DILocation(line: 83, column: 14, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !12, line: 86, type: !48)
!139 = distinct !DILexicalBlock(scope: !112, file: !12, line: 85, column: 5)
!140 = !DILocation(line: 86, column: 16, scope: !139)
!141 = !DILocalVariable(name: "destLen", scope: !139, file: !12, line: 86, type: !48)
!142 = !DILocation(line: 86, column: 19, scope: !139)
!143 = !DILocalVariable(name: "dest", scope: !139, file: !12, line: 87, type: !55)
!144 = !DILocation(line: 87, column: 14, scope: !139)
!145 = !DILocation(line: 88, column: 9, scope: !139)
!146 = !DILocation(line: 89, column: 9, scope: !139)
!147 = !DILocation(line: 89, column: 21, scope: !139)
!148 = !DILocation(line: 90, column: 26, scope: !139)
!149 = !DILocation(line: 90, column: 19, scope: !139)
!150 = !DILocation(line: 90, column: 17, scope: !139)
!151 = !DILocation(line: 93, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !12, line: 93, column: 9)
!153 = !DILocation(line: 93, column: 14, scope: !152)
!154 = !DILocation(line: 93, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 93, column: 9)
!156 = !DILocation(line: 93, column: 25, scope: !155)
!157 = !DILocation(line: 93, column: 23, scope: !155)
!158 = !DILocation(line: 93, column: 9, scope: !152)
!159 = !DILocation(line: 95, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 94, column: 9)
!161 = !DILocation(line: 95, column: 28, scope: !160)
!162 = !DILocation(line: 95, column: 18, scope: !160)
!163 = !DILocation(line: 95, column: 13, scope: !160)
!164 = !DILocation(line: 95, column: 21, scope: !160)
!165 = !DILocation(line: 96, column: 9, scope: !160)
!166 = !DILocation(line: 93, column: 35, scope: !155)
!167 = !DILocation(line: 93, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !84}
!169 = !DILocation(line: 96, column: 9, scope: !152)
!170 = !DILocation(line: 97, column: 9, scope: !139)
!171 = !DILocation(line: 97, column: 21, scope: !139)
!172 = !DILocation(line: 98, column: 19, scope: !139)
!173 = !DILocation(line: 98, column: 9, scope: !139)
!174 = !DILocation(line: 100, column: 1, scope: !112)
!175 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!176 = !DILocalVariable(name: "data", scope: !175, file: !12, line: 105, type: !6)
!177 = !DILocation(line: 105, column: 12, scope: !175)
!178 = !DILocalVariable(name: "dataBadBuffer", scope: !175, file: !12, line: 106, type: !6)
!179 = !DILocation(line: 106, column: 12, scope: !175)
!180 = !DILocation(line: 106, column: 36, scope: !175)
!181 = !DILocalVariable(name: "dataGoodBuffer", scope: !175, file: !12, line: 107, type: !6)
!182 = !DILocation(line: 107, column: 12, scope: !175)
!183 = !DILocation(line: 107, column: 37, scope: !175)
!184 = !DILocation(line: 108, column: 12, scope: !175)
!185 = !DILocation(line: 108, column: 5, scope: !175)
!186 = !DILocation(line: 109, column: 5, scope: !175)
!187 = !DILocation(line: 109, column: 25, scope: !175)
!188 = !DILocation(line: 110, column: 12, scope: !175)
!189 = !DILocation(line: 110, column: 5, scope: !175)
!190 = !DILocation(line: 111, column: 5, scope: !175)
!191 = !DILocation(line: 111, column: 27, scope: !175)
!192 = !DILocation(line: 112, column: 8, scope: !193)
!193 = distinct !DILexicalBlock(scope: !175, file: !12, line: 112, column: 8)
!194 = !DILocation(line: 112, column: 8, scope: !175)
!195 = !DILocation(line: 115, column: 16, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 113, column: 5)
!197 = !DILocation(line: 115, column: 14, scope: !196)
!198 = !DILocation(line: 116, column: 5, scope: !196)
!199 = !DILocalVariable(name: "i", scope: !200, file: !12, line: 118, type: !48)
!200 = distinct !DILexicalBlock(scope: !175, file: !12, line: 117, column: 5)
!201 = !DILocation(line: 118, column: 16, scope: !200)
!202 = !DILocalVariable(name: "destLen", scope: !200, file: !12, line: 118, type: !48)
!203 = !DILocation(line: 118, column: 19, scope: !200)
!204 = !DILocalVariable(name: "dest", scope: !200, file: !12, line: 119, type: !55)
!205 = !DILocation(line: 119, column: 14, scope: !200)
!206 = !DILocation(line: 120, column: 9, scope: !200)
!207 = !DILocation(line: 121, column: 9, scope: !200)
!208 = !DILocation(line: 121, column: 21, scope: !200)
!209 = !DILocation(line: 122, column: 26, scope: !200)
!210 = !DILocation(line: 122, column: 19, scope: !200)
!211 = !DILocation(line: 122, column: 17, scope: !200)
!212 = !DILocation(line: 125, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !200, file: !12, line: 125, column: 9)
!214 = !DILocation(line: 125, column: 14, scope: !213)
!215 = !DILocation(line: 125, column: 21, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !12, line: 125, column: 9)
!217 = !DILocation(line: 125, column: 25, scope: !216)
!218 = !DILocation(line: 125, column: 23, scope: !216)
!219 = !DILocation(line: 125, column: 9, scope: !213)
!220 = !DILocation(line: 127, column: 23, scope: !221)
!221 = distinct !DILexicalBlock(scope: !216, file: !12, line: 126, column: 9)
!222 = !DILocation(line: 127, column: 28, scope: !221)
!223 = !DILocation(line: 127, column: 18, scope: !221)
!224 = !DILocation(line: 127, column: 13, scope: !221)
!225 = !DILocation(line: 127, column: 21, scope: !221)
!226 = !DILocation(line: 128, column: 9, scope: !221)
!227 = !DILocation(line: 125, column: 35, scope: !216)
!228 = !DILocation(line: 125, column: 9, scope: !216)
!229 = distinct !{!229, !219, !230, !84}
!230 = !DILocation(line: 128, column: 9, scope: !213)
!231 = !DILocation(line: 129, column: 9, scope: !200)
!232 = !DILocation(line: 129, column: 21, scope: !200)
!233 = !DILocation(line: 130, column: 19, scope: !200)
!234 = !DILocation(line: 130, column: 9, scope: !200)
!235 = !DILocation(line: 132, column: 1, scope: !175)
