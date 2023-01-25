; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 11, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  %2 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %3, i8** %data, align 8, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !53
  store i64 %call, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !58
  %7 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %7, 1, !dbg !61
  %cmp1 = icmp ult i64 %6, %add, !dbg !62
  br i1 %cmp1, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !66
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !66
  %10 = load i8*, i8** %data, align 8, !dbg !67
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !67
  store i8 %9, i8* %arrayidx3, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %12, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* %13), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* null) #7, !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 %conv) #7, !dbg !93
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_good(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 10, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 11, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %2 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp ne i32 %2, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

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
  %cmp1 = icmp ult i64 %6, %add, !dbg !139
  br i1 %cmp1, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !143
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !143
  %10 = load i8*, i8** %data, align 8, !dbg !144
  %11 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !144
  store i8 %9, i8* %arrayidx3, align 1, !dbg !146
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
  %2 = load i32, i32* @staticFive, align 4, !dbg !164
  %cmp = icmp eq i32 %2, 5, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !168
  store i8* %3, i8** %data, align 8, !dbg !170
  %4 = load i8*, i8** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !174, metadata !DIExpression()), !dbg !176
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !179, metadata !DIExpression()), !dbg !180
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !181
  %call = call i64 @strlen(i8* %arraydecay) #6, !dbg !182
  store i64 %call, i64* %sourceLen, align 8, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !187
  %7 = load i64, i64* %sourceLen, align 8, !dbg !189
  %add = add i64 %7, 1, !dbg !190
  %cmp1 = icmp ult i64 %6, %add, !dbg !191
  br i1 %cmp1, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %8, !dbg !195
  %9 = load i8, i8* %arrayidx2, align 1, !dbg !195
  %10 = load i8*, i8** %data, align 8, !dbg !196
  %11 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !196
  store i8 %9, i8* %arrayidx3, align 1, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %12, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %13 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* %13), !dbg !205
  ret void, !dbg !206
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 30, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_bad", scope: !10, file: !10, line: 34, type: !19, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 36, type: !6)
!22 = !DILocation(line: 36, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !10, line: 37, type: !6)
!24 = !DILocation(line: 37, column: 12, scope: !18)
!25 = !DILocation(line: 37, column: 36, scope: !18)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !10, line: 38, type: !6)
!27 = !DILocation(line: 38, column: 12, scope: !18)
!28 = !DILocation(line: 38, column: 37, scope: !18)
!29 = !DILocation(line: 39, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !10, line: 39, column: 8)
!31 = !DILocation(line: 39, column: 18, scope: !30)
!32 = !DILocation(line: 39, column: 8, scope: !18)
!33 = !DILocation(line: 43, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 40, column: 5)
!35 = !DILocation(line: 43, column: 14, scope: !34)
!36 = !DILocation(line: 44, column: 9, scope: !34)
!37 = !DILocation(line: 44, column: 17, scope: !34)
!38 = !DILocation(line: 45, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !10, line: 47, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !10, line: 46, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 47, column: 14, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !10, line: 48, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 46, baseType: !48)
!47 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!48 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 48, column: 16, scope: !40)
!50 = !DILocalVariable(name: "sourceLen", scope: !40, file: !10, line: 48, type: !46)
!51 = !DILocation(line: 48, column: 19, scope: !40)
!52 = !DILocation(line: 49, column: 28, scope: !40)
!53 = !DILocation(line: 49, column: 21, scope: !40)
!54 = !DILocation(line: 49, column: 19, scope: !40)
!55 = !DILocation(line: 52, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !10, line: 52, column: 9)
!57 = !DILocation(line: 52, column: 14, scope: !56)
!58 = !DILocation(line: 52, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !10, line: 52, column: 9)
!60 = !DILocation(line: 52, column: 25, scope: !59)
!61 = !DILocation(line: 52, column: 35, scope: !59)
!62 = !DILocation(line: 52, column: 23, scope: !59)
!63 = !DILocation(line: 52, column: 9, scope: !56)
!64 = !DILocation(line: 54, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !10, line: 53, column: 9)
!66 = !DILocation(line: 54, column: 23, scope: !65)
!67 = !DILocation(line: 54, column: 13, scope: !65)
!68 = !DILocation(line: 54, column: 18, scope: !65)
!69 = !DILocation(line: 54, column: 21, scope: !65)
!70 = !DILocation(line: 55, column: 9, scope: !65)
!71 = !DILocation(line: 52, column: 41, scope: !59)
!72 = !DILocation(line: 52, column: 9, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 55, column: 9, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 56, column: 19, scope: !40)
!77 = !DILocation(line: 56, column: 9, scope: !40)
!78 = !DILocation(line: 58, column: 1, scope: !18)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_07_good", scope: !10, file: !10, line: 123, type: !19, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 125, column: 5, scope: !79)
!81 = !DILocation(line: 126, column: 5, scope: !79)
!82 = !DILocation(line: 127, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 139, type: !84, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DISubroutineType(types: !85)
!85 = !{!11, !11, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !10, line: 139, type: !11)
!88 = !DILocation(line: 139, column: 14, scope: !83)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !10, line: 139, type: !86)
!90 = !DILocation(line: 139, column: 27, scope: !83)
!91 = !DILocation(line: 142, column: 22, scope: !83)
!92 = !DILocation(line: 142, column: 12, scope: !83)
!93 = !DILocation(line: 142, column: 5, scope: !83)
!94 = !DILocation(line: 144, column: 5, scope: !83)
!95 = !DILocation(line: 145, column: 5, scope: !83)
!96 = !DILocation(line: 146, column: 5, scope: !83)
!97 = !DILocation(line: 149, column: 5, scope: !83)
!98 = !DILocation(line: 150, column: 5, scope: !83)
!99 = !DILocation(line: 151, column: 5, scope: !83)
!100 = !DILocation(line: 153, column: 5, scope: !83)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 67, type: !6)
!103 = !DILocation(line: 67, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !10, line: 68, type: !6)
!105 = !DILocation(line: 68, column: 12, scope: !101)
!106 = !DILocation(line: 68, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !10, line: 69, type: !6)
!108 = !DILocation(line: 69, column: 12, scope: !101)
!109 = !DILocation(line: 69, column: 37, scope: !101)
!110 = !DILocation(line: 70, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !10, line: 70, column: 8)
!112 = !DILocation(line: 70, column: 18, scope: !111)
!113 = !DILocation(line: 70, column: 8, scope: !101)
!114 = !DILocation(line: 73, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !10, line: 71, column: 5)
!116 = !DILocation(line: 74, column: 5, scope: !115)
!117 = !DILocation(line: 79, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !10, line: 76, column: 5)
!119 = !DILocation(line: 79, column: 14, scope: !118)
!120 = !DILocation(line: 80, column: 9, scope: !118)
!121 = !DILocation(line: 80, column: 17, scope: !118)
!122 = !DILocalVariable(name: "source", scope: !123, file: !10, line: 83, type: !41)
!123 = distinct !DILexicalBlock(scope: !101, file: !10, line: 82, column: 5)
!124 = !DILocation(line: 83, column: 14, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !10, line: 84, type: !46)
!126 = !DILocation(line: 84, column: 16, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !10, line: 84, type: !46)
!128 = !DILocation(line: 84, column: 19, scope: !123)
!129 = !DILocation(line: 85, column: 28, scope: !123)
!130 = !DILocation(line: 85, column: 21, scope: !123)
!131 = !DILocation(line: 85, column: 19, scope: !123)
!132 = !DILocation(line: 88, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !10, line: 88, column: 9)
!134 = !DILocation(line: 88, column: 14, scope: !133)
!135 = !DILocation(line: 88, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !10, line: 88, column: 9)
!137 = !DILocation(line: 88, column: 25, scope: !136)
!138 = !DILocation(line: 88, column: 35, scope: !136)
!139 = !DILocation(line: 88, column: 23, scope: !136)
!140 = !DILocation(line: 88, column: 9, scope: !133)
!141 = !DILocation(line: 90, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !10, line: 89, column: 9)
!143 = !DILocation(line: 90, column: 23, scope: !142)
!144 = !DILocation(line: 90, column: 13, scope: !142)
!145 = !DILocation(line: 90, column: 18, scope: !142)
!146 = !DILocation(line: 90, column: 21, scope: !142)
!147 = !DILocation(line: 91, column: 9, scope: !142)
!148 = !DILocation(line: 88, column: 41, scope: !136)
!149 = !DILocation(line: 88, column: 9, scope: !136)
!150 = distinct !{!150, !140, !151, !75}
!151 = !DILocation(line: 91, column: 9, scope: !133)
!152 = !DILocation(line: 92, column: 19, scope: !123)
!153 = !DILocation(line: 92, column: 9, scope: !123)
!154 = !DILocation(line: 94, column: 1, scope: !101)
!155 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 97, type: !19, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DILocalVariable(name: "data", scope: !155, file: !10, line: 99, type: !6)
!157 = !DILocation(line: 99, column: 12, scope: !155)
!158 = !DILocalVariable(name: "dataBadBuffer", scope: !155, file: !10, line: 100, type: !6)
!159 = !DILocation(line: 100, column: 12, scope: !155)
!160 = !DILocation(line: 100, column: 36, scope: !155)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !155, file: !10, line: 101, type: !6)
!162 = !DILocation(line: 101, column: 12, scope: !155)
!163 = !DILocation(line: 101, column: 37, scope: !155)
!164 = !DILocation(line: 102, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !155, file: !10, line: 102, column: 8)
!166 = !DILocation(line: 102, column: 18, scope: !165)
!167 = !DILocation(line: 102, column: 8, scope: !155)
!168 = !DILocation(line: 106, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !10, line: 103, column: 5)
!170 = !DILocation(line: 106, column: 14, scope: !169)
!171 = !DILocation(line: 107, column: 9, scope: !169)
!172 = !DILocation(line: 107, column: 17, scope: !169)
!173 = !DILocation(line: 108, column: 5, scope: !169)
!174 = !DILocalVariable(name: "source", scope: !175, file: !10, line: 110, type: !41)
!175 = distinct !DILexicalBlock(scope: !155, file: !10, line: 109, column: 5)
!176 = !DILocation(line: 110, column: 14, scope: !175)
!177 = !DILocalVariable(name: "i", scope: !175, file: !10, line: 111, type: !46)
!178 = !DILocation(line: 111, column: 16, scope: !175)
!179 = !DILocalVariable(name: "sourceLen", scope: !175, file: !10, line: 111, type: !46)
!180 = !DILocation(line: 111, column: 19, scope: !175)
!181 = !DILocation(line: 112, column: 28, scope: !175)
!182 = !DILocation(line: 112, column: 21, scope: !175)
!183 = !DILocation(line: 112, column: 19, scope: !175)
!184 = !DILocation(line: 115, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !175, file: !10, line: 115, column: 9)
!186 = !DILocation(line: 115, column: 14, scope: !185)
!187 = !DILocation(line: 115, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !10, line: 115, column: 9)
!189 = !DILocation(line: 115, column: 25, scope: !188)
!190 = !DILocation(line: 115, column: 35, scope: !188)
!191 = !DILocation(line: 115, column: 23, scope: !188)
!192 = !DILocation(line: 115, column: 9, scope: !185)
!193 = !DILocation(line: 117, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !10, line: 116, column: 9)
!195 = !DILocation(line: 117, column: 23, scope: !194)
!196 = !DILocation(line: 117, column: 13, scope: !194)
!197 = !DILocation(line: 117, column: 18, scope: !194)
!198 = !DILocation(line: 117, column: 21, scope: !194)
!199 = !DILocation(line: 118, column: 9, scope: !194)
!200 = !DILocation(line: 115, column: 41, scope: !188)
!201 = !DILocation(line: 115, column: 9, scope: !188)
!202 = distinct !{!202, !192, !203, !75}
!203 = !DILocation(line: 118, column: 9, scope: !185)
!204 = !DILocation(line: 119, column: 19, scope: !175)
!205 = !DILocation(line: 119, column: 9, scope: !175)
!206 = !DILocation(line: 121, column: 1, scope: !155)
