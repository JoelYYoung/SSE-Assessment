; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_bad.source to i8*), i64 44, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !48
  store i64 %call, i64* %sourceLen, align 8, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !53
  %8 = load i64, i64* %sourceLen, align 8, !dbg !55
  %add = add i64 %8, 1, !dbg !56
  %cmp = icmp ult i64 %7, %add, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !61
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !61
  %11 = load i32*, i32** %data, align 8, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !62
  store i32 %10, i32* %arrayidx2, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %13, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %14), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #7, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #7, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 40, align 16, !dbg !103
  %1 = bitcast i8* %0 to i32*, !dbg !104
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %2 = alloca i8, i64 44, align 16, !dbg !107
  %3 = bitcast i8* %2 to i32*, !dbg !108
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !106
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !109
  store i32* %4, i32** %data, align 8, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !122
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !123
  store i64 %call, i64* %sourceLen, align 8, !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !128
  %8 = load i64, i64* %sourceLen, align 8, !dbg !130
  %add = add i64 %8, 1, !dbg !131
  %cmp = icmp ult i64 %7, %add, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !136
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !136
  %11 = load i32*, i32** %data, align 8, !dbg !137
  %12 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !137
  store i32 %10, i32* %arrayidx2, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %13, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !145
  call void @printWLine(i32* %14), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = alloca i8, i64 40, align 16, !dbg !153
  %1 = bitcast i8* %0 to i32*, !dbg !154
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %2 = alloca i8, i64 44, align 16, !dbg !157
  %3 = bitcast i8* %2 to i32*, !dbg !158
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !156
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !159
  store i32* %4, i32** %data, align 8, !dbg !162
  %5 = load i32*, i32** %data, align 8, !dbg !163
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !164
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !165, metadata !DIExpression()), !dbg !167
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !167
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !172
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !173
  store i64 %call, i64* %sourceLen, align 8, !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !178
  %8 = load i64, i64* %sourceLen, align 8, !dbg !180
  %add = add i64 %8, 1, !dbg !181
  %cmp = icmp ult i64 %7, %add, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !186
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !186
  %11 = load i32*, i32** %data, align 8, !dbg !187
  %12 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !187
  store i32 %10, i32* %arrayidx2, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %13, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !195
  call void @printWLine(i32* %14), !dbg !196
  ret void, !dbg !197
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_bad", scope: !16, file: !16, line: 32, type: !17, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 34, type: !4)
!20 = !DILocation(line: 34, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 35, type: !4)
!22 = !DILocation(line: 35, column: 15, scope: !15)
!23 = !DILocation(line: 35, column: 42, scope: !15)
!24 = !DILocation(line: 35, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 36, type: !4)
!26 = !DILocation(line: 36, column: 15, scope: !15)
!27 = !DILocation(line: 36, column: 43, scope: !15)
!28 = !DILocation(line: 36, column: 32, scope: !15)
!29 = !DILocation(line: 41, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 38, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 8)
!32 = !DILocation(line: 41, column: 14, scope: !30)
!33 = !DILocation(line: 42, column: 9, scope: !30)
!34 = !DILocation(line: 42, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 45, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 44, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 45, column: 17, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !16, line: 46, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !43)
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 46, column: 16, scope: !36)
!45 = !DILocalVariable(name: "sourceLen", scope: !36, file: !16, line: 46, type: !42)
!46 = !DILocation(line: 46, column: 19, scope: !36)
!47 = !DILocation(line: 47, column: 28, scope: !36)
!48 = !DILocation(line: 47, column: 21, scope: !36)
!49 = !DILocation(line: 47, column: 19, scope: !36)
!50 = !DILocation(line: 50, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !36, file: !16, line: 50, column: 9)
!52 = !DILocation(line: 50, column: 14, scope: !51)
!53 = !DILocation(line: 50, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !16, line: 50, column: 9)
!55 = !DILocation(line: 50, column: 25, scope: !54)
!56 = !DILocation(line: 50, column: 35, scope: !54)
!57 = !DILocation(line: 50, column: 23, scope: !54)
!58 = !DILocation(line: 50, column: 9, scope: !51)
!59 = !DILocation(line: 52, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !16, line: 51, column: 9)
!61 = !DILocation(line: 52, column: 23, scope: !60)
!62 = !DILocation(line: 52, column: 13, scope: !60)
!63 = !DILocation(line: 52, column: 18, scope: !60)
!64 = !DILocation(line: 52, column: 21, scope: !60)
!65 = !DILocation(line: 53, column: 9, scope: !60)
!66 = !DILocation(line: 50, column: 41, scope: !54)
!67 = !DILocation(line: 50, column: 9, scope: !54)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 53, column: 9, scope: !51)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 54, column: 20, scope: !36)
!72 = !DILocation(line: 54, column: 9, scope: !36)
!73 = !DILocation(line: 56, column: 1, scope: !15)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_06_good", scope: !16, file: !16, line: 121, type: !17, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 123, column: 5, scope: !74)
!76 = !DILocation(line: 124, column: 5, scope: !74)
!77 = !DILocation(line: 125, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 137, type: !79, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !16, line: 137, type: !7)
!85 = !DILocation(line: 137, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !16, line: 137, type: !81)
!87 = !DILocation(line: 137, column: 27, scope: !78)
!88 = !DILocation(line: 140, column: 22, scope: !78)
!89 = !DILocation(line: 140, column: 12, scope: !78)
!90 = !DILocation(line: 140, column: 5, scope: !78)
!91 = !DILocation(line: 142, column: 5, scope: !78)
!92 = !DILocation(line: 143, column: 5, scope: !78)
!93 = !DILocation(line: 144, column: 5, scope: !78)
!94 = !DILocation(line: 147, column: 5, scope: !78)
!95 = !DILocation(line: 148, column: 5, scope: !78)
!96 = !DILocation(line: 149, column: 5, scope: !78)
!97 = !DILocation(line: 151, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 63, type: !17, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 65, type: !4)
!100 = !DILocation(line: 65, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !16, line: 66, type: !4)
!102 = !DILocation(line: 66, column: 15, scope: !98)
!103 = !DILocation(line: 66, column: 42, scope: !98)
!104 = !DILocation(line: 66, column: 31, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !16, line: 67, type: !4)
!106 = !DILocation(line: 67, column: 15, scope: !98)
!107 = !DILocation(line: 67, column: 43, scope: !98)
!108 = !DILocation(line: 67, column: 32, scope: !98)
!109 = !DILocation(line: 77, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !16, line: 74, column: 5)
!111 = distinct !DILexicalBlock(scope: !98, file: !16, line: 68, column: 8)
!112 = !DILocation(line: 77, column: 14, scope: !110)
!113 = !DILocation(line: 78, column: 9, scope: !110)
!114 = !DILocation(line: 78, column: 17, scope: !110)
!115 = !DILocalVariable(name: "source", scope: !116, file: !16, line: 81, type: !37)
!116 = distinct !DILexicalBlock(scope: !98, file: !16, line: 80, column: 5)
!117 = !DILocation(line: 81, column: 17, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !116, file: !16, line: 82, type: !42)
!119 = !DILocation(line: 82, column: 16, scope: !116)
!120 = !DILocalVariable(name: "sourceLen", scope: !116, file: !16, line: 82, type: !42)
!121 = !DILocation(line: 82, column: 19, scope: !116)
!122 = !DILocation(line: 83, column: 28, scope: !116)
!123 = !DILocation(line: 83, column: 21, scope: !116)
!124 = !DILocation(line: 83, column: 19, scope: !116)
!125 = !DILocation(line: 86, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !116, file: !16, line: 86, column: 9)
!127 = !DILocation(line: 86, column: 14, scope: !126)
!128 = !DILocation(line: 86, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !16, line: 86, column: 9)
!130 = !DILocation(line: 86, column: 25, scope: !129)
!131 = !DILocation(line: 86, column: 35, scope: !129)
!132 = !DILocation(line: 86, column: 23, scope: !129)
!133 = !DILocation(line: 86, column: 9, scope: !126)
!134 = !DILocation(line: 88, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !16, line: 87, column: 9)
!136 = !DILocation(line: 88, column: 23, scope: !135)
!137 = !DILocation(line: 88, column: 13, scope: !135)
!138 = !DILocation(line: 88, column: 18, scope: !135)
!139 = !DILocation(line: 88, column: 21, scope: !135)
!140 = !DILocation(line: 89, column: 9, scope: !135)
!141 = !DILocation(line: 86, column: 41, scope: !129)
!142 = !DILocation(line: 86, column: 9, scope: !129)
!143 = distinct !{!143, !133, !144, !70}
!144 = !DILocation(line: 89, column: 9, scope: !126)
!145 = !DILocation(line: 90, column: 20, scope: !116)
!146 = !DILocation(line: 90, column: 9, scope: !116)
!147 = !DILocation(line: 92, column: 1, scope: !98)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 95, type: !17, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !16, line: 97, type: !4)
!150 = !DILocation(line: 97, column: 15, scope: !148)
!151 = !DILocalVariable(name: "dataBadBuffer", scope: !148, file: !16, line: 98, type: !4)
!152 = !DILocation(line: 98, column: 15, scope: !148)
!153 = !DILocation(line: 98, column: 42, scope: !148)
!154 = !DILocation(line: 98, column: 31, scope: !148)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !148, file: !16, line: 99, type: !4)
!156 = !DILocation(line: 99, column: 15, scope: !148)
!157 = !DILocation(line: 99, column: 43, scope: !148)
!158 = !DILocation(line: 99, column: 32, scope: !148)
!159 = !DILocation(line: 104, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !161, file: !16, line: 101, column: 5)
!161 = distinct !DILexicalBlock(scope: !148, file: !16, line: 100, column: 8)
!162 = !DILocation(line: 104, column: 14, scope: !160)
!163 = !DILocation(line: 105, column: 9, scope: !160)
!164 = !DILocation(line: 105, column: 17, scope: !160)
!165 = !DILocalVariable(name: "source", scope: !166, file: !16, line: 108, type: !37)
!166 = distinct !DILexicalBlock(scope: !148, file: !16, line: 107, column: 5)
!167 = !DILocation(line: 108, column: 17, scope: !166)
!168 = !DILocalVariable(name: "i", scope: !166, file: !16, line: 109, type: !42)
!169 = !DILocation(line: 109, column: 16, scope: !166)
!170 = !DILocalVariable(name: "sourceLen", scope: !166, file: !16, line: 109, type: !42)
!171 = !DILocation(line: 109, column: 19, scope: !166)
!172 = !DILocation(line: 110, column: 28, scope: !166)
!173 = !DILocation(line: 110, column: 21, scope: !166)
!174 = !DILocation(line: 110, column: 19, scope: !166)
!175 = !DILocation(line: 113, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !166, file: !16, line: 113, column: 9)
!177 = !DILocation(line: 113, column: 14, scope: !176)
!178 = !DILocation(line: 113, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !16, line: 113, column: 9)
!180 = !DILocation(line: 113, column: 25, scope: !179)
!181 = !DILocation(line: 113, column: 35, scope: !179)
!182 = !DILocation(line: 113, column: 23, scope: !179)
!183 = !DILocation(line: 113, column: 9, scope: !176)
!184 = !DILocation(line: 115, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !179, file: !16, line: 114, column: 9)
!186 = !DILocation(line: 115, column: 23, scope: !185)
!187 = !DILocation(line: 115, column: 13, scope: !185)
!188 = !DILocation(line: 115, column: 18, scope: !185)
!189 = !DILocation(line: 115, column: 21, scope: !185)
!190 = !DILocation(line: 116, column: 9, scope: !185)
!191 = !DILocation(line: 113, column: 41, scope: !179)
!192 = !DILocation(line: 113, column: 9, scope: !179)
!193 = distinct !{!193, !183, !194, !70}
!194 = !DILocation(line: 116, column: 9, scope: !176)
!195 = !DILocation(line: 117, column: 20, scope: !166)
!196 = !DILocation(line: 117, column: 9, scope: !166)
!197 = !DILocation(line: 119, column: 1, scope: !148)
