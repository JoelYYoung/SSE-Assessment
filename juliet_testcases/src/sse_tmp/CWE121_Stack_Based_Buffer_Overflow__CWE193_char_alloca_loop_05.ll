; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !31
  %tobool = icmp ne i32 %2, 0, !dbg !31
  br i1 %tobool, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !54
  store i64 %call, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !59
  %7 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %7, 1, !dbg !62
  %cmp = icmp ult i64 %6, %add, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !67
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !67
  %10 = load i8*, i8** %data, align 8, !dbg !68
  %11 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !68
  store i8 %9, i8* %arrayidx2, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %12, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !77
  call void @printLine(i8* %13), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* null) #7, !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 %conv) #7, !dbg !94
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_good(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_bad(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 10, align 16, !dbg !107
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %1 = alloca i8, i64 11, align 16, !dbg !110
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !109
  %2 = load i32, i32* @staticFalse, align 4, !dbg !111
  %tobool = icmp ne i32 %2, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  store i8* %3, i8** %data, align 8, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !129
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !130
  store i64 %call, i64* %sourceLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !135
  %7 = load i64, i64* %sourceLen, align 8, !dbg !137
  %add = add i64 %7, 1, !dbg !138
  %cmp = icmp ult i64 %6, %add, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !143
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !143
  %10 = load i8*, i8** %data, align 8, !dbg !144
  %11 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !144
  store i8 %9, i8* %arrayidx2, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %12, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* %13), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !155 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = alloca i8, i64 10, align 16, !dbg !160
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %1 = alloca i8, i64 11, align 16, !dbg !163
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !162
  %2 = load i32, i32* @staticTrue, align 4, !dbg !164
  %tobool = icmp ne i32 %2, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !167
  store i8* %3, i8** %data, align 8, !dbg !169
  %4 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !173, metadata !DIExpression()), !dbg !175
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !178, metadata !DIExpression()), !dbg !179
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !180
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !181
  store i64 %call, i64* %sourceLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !186
  %7 = load i64, i64* %sourceLen, align 8, !dbg !188
  %add = add i64 %7, 1, !dbg !189
  %cmp = icmp ult i64 %6, %add, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !194
  %9 = load i8, i8* %arrayidx1, align 1, !dbg !194
  %10 = load i8*, i8** %data, align 8, !dbg !195
  %11 = load i64, i64* %i, align 8, !dbg !196
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !195
  store i8 %9, i8* %arrayidx2, align 1, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %12, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !203
  call void @printLine(i8* %13), !dbg !204
  ret void, !dbg !205
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 30, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 31, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_bad", scope: !12, file: !12, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !12, line: 38, type: !6)
!26 = !DILocation(line: 38, column: 12, scope: !20)
!27 = !DILocation(line: 38, column: 36, scope: !20)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !12, line: 39, type: !6)
!29 = !DILocation(line: 39, column: 12, scope: !20)
!30 = !DILocation(line: 39, column: 37, scope: !20)
!31 = !DILocation(line: 40, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !12, line: 40, column: 8)
!33 = !DILocation(line: 40, column: 8, scope: !20)
!34 = !DILocation(line: 44, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 5)
!36 = !DILocation(line: 44, column: 14, scope: !35)
!37 = !DILocation(line: 45, column: 9, scope: !35)
!38 = !DILocation(line: 45, column: 17, scope: !35)
!39 = !DILocation(line: 46, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 48, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !12, line: 47, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 48, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 49, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 49, column: 16, scope: !41)
!51 = !DILocalVariable(name: "sourceLen", scope: !41, file: !12, line: 49, type: !47)
!52 = !DILocation(line: 49, column: 19, scope: !41)
!53 = !DILocation(line: 50, column: 28, scope: !41)
!54 = !DILocation(line: 50, column: 21, scope: !41)
!55 = !DILocation(line: 50, column: 19, scope: !41)
!56 = !DILocation(line: 53, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !12, line: 53, column: 9)
!58 = !DILocation(line: 53, column: 14, scope: !57)
!59 = !DILocation(line: 53, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 53, column: 9)
!61 = !DILocation(line: 53, column: 25, scope: !60)
!62 = !DILocation(line: 53, column: 35, scope: !60)
!63 = !DILocation(line: 53, column: 23, scope: !60)
!64 = !DILocation(line: 53, column: 9, scope: !57)
!65 = !DILocation(line: 55, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !12, line: 54, column: 9)
!67 = !DILocation(line: 55, column: 23, scope: !66)
!68 = !DILocation(line: 55, column: 13, scope: !66)
!69 = !DILocation(line: 55, column: 18, scope: !66)
!70 = !DILocation(line: 55, column: 21, scope: !66)
!71 = !DILocation(line: 56, column: 9, scope: !66)
!72 = !DILocation(line: 53, column: 41, scope: !60)
!73 = !DILocation(line: 53, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 56, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 57, column: 19, scope: !41)
!78 = !DILocation(line: 57, column: 9, scope: !41)
!79 = !DILocation(line: 59, column: 1, scope: !20)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_05_good", scope: !12, file: !12, line: 124, type: !21, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 126, column: 5, scope: !80)
!82 = !DILocation(line: 127, column: 5, scope: !80)
!83 = !DILocation(line: 128, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 140, type: !85, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DISubroutineType(types: !86)
!86 = !{!13, !13, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 140, type: !13)
!89 = !DILocation(line: 140, column: 14, scope: !84)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 140, type: !87)
!91 = !DILocation(line: 140, column: 27, scope: !84)
!92 = !DILocation(line: 143, column: 22, scope: !84)
!93 = !DILocation(line: 143, column: 12, scope: !84)
!94 = !DILocation(line: 143, column: 5, scope: !84)
!95 = !DILocation(line: 145, column: 5, scope: !84)
!96 = !DILocation(line: 146, column: 5, scope: !84)
!97 = !DILocation(line: 147, column: 5, scope: !84)
!98 = !DILocation(line: 150, column: 5, scope: !84)
!99 = !DILocation(line: 151, column: 5, scope: !84)
!100 = !DILocation(line: 152, column: 5, scope: !84)
!101 = !DILocation(line: 154, column: 5, scope: !84)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 68, type: !6)
!104 = !DILocation(line: 68, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !12, line: 69, type: !6)
!106 = !DILocation(line: 69, column: 12, scope: !102)
!107 = !DILocation(line: 69, column: 36, scope: !102)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !12, line: 70, type: !6)
!109 = !DILocation(line: 70, column: 12, scope: !102)
!110 = !DILocation(line: 70, column: 37, scope: !102)
!111 = !DILocation(line: 71, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !102, file: !12, line: 71, column: 8)
!113 = !DILocation(line: 71, column: 8, scope: !102)
!114 = !DILocation(line: 74, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 72, column: 5)
!116 = !DILocation(line: 75, column: 5, scope: !115)
!117 = !DILocation(line: 80, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !12, line: 77, column: 5)
!119 = !DILocation(line: 80, column: 14, scope: !118)
!120 = !DILocation(line: 81, column: 9, scope: !118)
!121 = !DILocation(line: 81, column: 17, scope: !118)
!122 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 84, type: !42)
!123 = distinct !DILexicalBlock(scope: !102, file: !12, line: 83, column: 5)
!124 = !DILocation(line: 84, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !12, line: 85, type: !47)
!126 = !DILocation(line: 85, column: 16, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !12, line: 85, type: !47)
!128 = !DILocation(line: 85, column: 19, scope: !123)
!129 = !DILocation(line: 86, column: 28, scope: !123)
!130 = !DILocation(line: 86, column: 21, scope: !123)
!131 = !DILocation(line: 86, column: 19, scope: !123)
!132 = !DILocation(line: 89, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !12, line: 89, column: 9)
!134 = !DILocation(line: 89, column: 14, scope: !133)
!135 = !DILocation(line: 89, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 89, column: 9)
!137 = !DILocation(line: 89, column: 25, scope: !136)
!138 = !DILocation(line: 89, column: 35, scope: !136)
!139 = !DILocation(line: 89, column: 23, scope: !136)
!140 = !DILocation(line: 89, column: 9, scope: !133)
!141 = !DILocation(line: 91, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !12, line: 90, column: 9)
!143 = !DILocation(line: 91, column: 23, scope: !142)
!144 = !DILocation(line: 91, column: 13, scope: !142)
!145 = !DILocation(line: 91, column: 18, scope: !142)
!146 = !DILocation(line: 91, column: 21, scope: !142)
!147 = !DILocation(line: 92, column: 9, scope: !142)
!148 = !DILocation(line: 89, column: 41, scope: !136)
!149 = !DILocation(line: 89, column: 9, scope: !136)
!150 = distinct !{!150, !140, !151, !76}
!151 = !DILocation(line: 92, column: 9, scope: !133)
!152 = !DILocation(line: 93, column: 19, scope: !123)
!153 = !DILocation(line: 93, column: 9, scope: !123)
!154 = !DILocation(line: 95, column: 1, scope: !102)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !21, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !12, line: 100, type: !6)
!157 = !DILocation(line: 100, column: 12, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !12, line: 101, type: !6)
!159 = !DILocation(line: 101, column: 12, scope: !155)
!160 = !DILocation(line: 101, column: 36, scope: !155)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !12, line: 102, type: !6)
!162 = !DILocation(line: 102, column: 12, scope: !155)
!163 = !DILocation(line: 102, column: 37, scope: !155)
!164 = !DILocation(line: 103, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !155, file: !12, line: 103, column: 8)
!166 = !DILocation(line: 103, column: 8, scope: !155)
!167 = !DILocation(line: 107, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 104, column: 5)
!169 = !DILocation(line: 107, column: 14, scope: !168)
!170 = !DILocation(line: 108, column: 9, scope: !168)
!171 = !DILocation(line: 108, column: 17, scope: !168)
!172 = !DILocation(line: 109, column: 5, scope: !168)
!173 = !DILocalVariable(name: "source", scope: !174, file: !12, line: 111, type: !42)
!174 = distinct !DILexicalBlock(scope: !155, file: !12, line: 110, column: 5)
!175 = !DILocation(line: 111, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !12, line: 112, type: !47)
!177 = !DILocation(line: 112, column: 16, scope: !174)
!178 = !DILocalVariable(name: "sourceLen", scope: !174, file: !12, line: 112, type: !47)
!179 = !DILocation(line: 112, column: 19, scope: !174)
!180 = !DILocation(line: 113, column: 28, scope: !174)
!181 = !DILocation(line: 113, column: 21, scope: !174)
!182 = !DILocation(line: 113, column: 19, scope: !174)
!183 = !DILocation(line: 116, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !12, line: 116, column: 9)
!185 = !DILocation(line: 116, column: 14, scope: !184)
!186 = !DILocation(line: 116, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !12, line: 116, column: 9)
!188 = !DILocation(line: 116, column: 25, scope: !187)
!189 = !DILocation(line: 116, column: 35, scope: !187)
!190 = !DILocation(line: 116, column: 23, scope: !187)
!191 = !DILocation(line: 116, column: 9, scope: !184)
!192 = !DILocation(line: 118, column: 30, scope: !193)
!193 = distinct !DILexicalBlock(scope: !187, file: !12, line: 117, column: 9)
!194 = !DILocation(line: 118, column: 23, scope: !193)
!195 = !DILocation(line: 118, column: 13, scope: !193)
!196 = !DILocation(line: 118, column: 18, scope: !193)
!197 = !DILocation(line: 118, column: 21, scope: !193)
!198 = !DILocation(line: 119, column: 9, scope: !193)
!199 = !DILocation(line: 116, column: 41, scope: !187)
!200 = !DILocation(line: 116, column: 9, scope: !187)
!201 = distinct !{!201, !191, !202, !76}
!202 = !DILocation(line: 119, column: 9, scope: !184)
!203 = !DILocation(line: 120, column: 19, scope: !174)
!204 = !DILocation(line: 120, column: 9, scope: !174)
!205 = !DILocation(line: 122, column: 1, scope: !155)
