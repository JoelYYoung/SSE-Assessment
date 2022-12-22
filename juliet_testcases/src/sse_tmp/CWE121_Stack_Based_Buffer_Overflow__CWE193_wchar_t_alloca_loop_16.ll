; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad() #0 !dbg !15 {
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
  br label %while.body, !dbg !29

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !30
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  br label %while.end, !dbg !35

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad.source to i8*), i64 44, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !49
  store i64 %call, i64* %sourceLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %while.end
  %7 = load i64, i64* %i, align 8, !dbg !54
  %8 = load i64, i64* %sourceLen, align 8, !dbg !56
  %add = add i64 %8, 1, !dbg !57
  %cmp = icmp ult i64 %7, %add, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !62
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !62
  %11 = load i32*, i32** %data, align 8, !dbg !63
  %12 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !63
  store i32 %10, i32* %arrayidx2, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %13, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !72
  call void @printWLine(i32* %14), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !98 {
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
  br label %while.body, !dbg !109

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !110
  store i32* %4, i32** %data, align 8, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  br label %while.end, !dbg !115

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !123
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !124
  store i64 %call, i64* %sourceLen, align 8, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %while.end
  %7 = load i64, i64* %i, align 8, !dbg !129
  %8 = load i64, i64* %sourceLen, align 8, !dbg !131
  %add = add i64 %8, 1, !dbg !132
  %cmp = icmp ult i64 %7, %add, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !137
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !137
  %11 = load i32*, i32** %data, align 8, !dbg !138
  %12 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !138
  store i32 %10, i32* %arrayidx2, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %13, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %14), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 5, scope: !15)
!30 = !DILocation(line: 37, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 9, scope: !31)
!34 = !DILocation(line: 38, column: 17, scope: !31)
!35 = !DILocation(line: 39, column: 9, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !16, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 41, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 42, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !16, line: 43, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !44)
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 43, column: 16, scope: !37)
!46 = !DILocalVariable(name: "sourceLen", scope: !37, file: !16, line: 43, type: !43)
!47 = !DILocation(line: 43, column: 19, scope: !37)
!48 = !DILocation(line: 44, column: 28, scope: !37)
!49 = !DILocation(line: 44, column: 21, scope: !37)
!50 = !DILocation(line: 44, column: 19, scope: !37)
!51 = !DILocation(line: 47, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !16, line: 47, column: 9)
!53 = !DILocation(line: 47, column: 14, scope: !52)
!54 = !DILocation(line: 47, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !16, line: 47, column: 9)
!56 = !DILocation(line: 47, column: 25, scope: !55)
!57 = !DILocation(line: 47, column: 35, scope: !55)
!58 = !DILocation(line: 47, column: 23, scope: !55)
!59 = !DILocation(line: 47, column: 9, scope: !52)
!60 = !DILocation(line: 49, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !16, line: 48, column: 9)
!62 = !DILocation(line: 49, column: 23, scope: !61)
!63 = !DILocation(line: 49, column: 13, scope: !61)
!64 = !DILocation(line: 49, column: 18, scope: !61)
!65 = !DILocation(line: 49, column: 21, scope: !61)
!66 = !DILocation(line: 50, column: 9, scope: !61)
!67 = !DILocation(line: 47, column: 41, scope: !55)
!68 = !DILocation(line: 47, column: 9, scope: !55)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 50, column: 9, scope: !52)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 51, column: 20, scope: !37)
!73 = !DILocation(line: 51, column: 9, scope: !37)
!74 = !DILocation(line: 53, column: 1, scope: !15)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_good", scope: !16, file: !16, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 89, column: 5, scope: !75)
!77 = !DILocation(line: 90, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 102, type: !79, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7, !7, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !16, line: 102, type: !7)
!85 = !DILocation(line: 102, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !16, line: 102, type: !81)
!87 = !DILocation(line: 102, column: 27, scope: !78)
!88 = !DILocation(line: 105, column: 22, scope: !78)
!89 = !DILocation(line: 105, column: 12, scope: !78)
!90 = !DILocation(line: 105, column: 5, scope: !78)
!91 = !DILocation(line: 107, column: 5, scope: !78)
!92 = !DILocation(line: 108, column: 5, scope: !78)
!93 = !DILocation(line: 109, column: 5, scope: !78)
!94 = !DILocation(line: 112, column: 5, scope: !78)
!95 = !DILocation(line: 113, column: 5, scope: !78)
!96 = !DILocation(line: 114, column: 5, scope: !78)
!97 = !DILocation(line: 116, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !16, line: 62, type: !4)
!100 = !DILocation(line: 62, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !16, line: 63, type: !4)
!102 = !DILocation(line: 63, column: 15, scope: !98)
!103 = !DILocation(line: 63, column: 42, scope: !98)
!104 = !DILocation(line: 63, column: 31, scope: !98)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !16, line: 64, type: !4)
!106 = !DILocation(line: 64, column: 15, scope: !98)
!107 = !DILocation(line: 64, column: 43, scope: !98)
!108 = !DILocation(line: 64, column: 32, scope: !98)
!109 = !DILocation(line: 65, column: 5, scope: !98)
!110 = !DILocation(line: 69, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !98, file: !16, line: 66, column: 5)
!112 = !DILocation(line: 69, column: 14, scope: !111)
!113 = !DILocation(line: 70, column: 9, scope: !111)
!114 = !DILocation(line: 70, column: 17, scope: !111)
!115 = !DILocation(line: 71, column: 9, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !16, line: 74, type: !38)
!117 = distinct !DILexicalBlock(scope: !98, file: !16, line: 73, column: 5)
!118 = !DILocation(line: 74, column: 17, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !117, file: !16, line: 75, type: !43)
!120 = !DILocation(line: 75, column: 16, scope: !117)
!121 = !DILocalVariable(name: "sourceLen", scope: !117, file: !16, line: 75, type: !43)
!122 = !DILocation(line: 75, column: 19, scope: !117)
!123 = !DILocation(line: 76, column: 28, scope: !117)
!124 = !DILocation(line: 76, column: 21, scope: !117)
!125 = !DILocation(line: 76, column: 19, scope: !117)
!126 = !DILocation(line: 79, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !117, file: !16, line: 79, column: 9)
!128 = !DILocation(line: 79, column: 14, scope: !127)
!129 = !DILocation(line: 79, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !16, line: 79, column: 9)
!131 = !DILocation(line: 79, column: 25, scope: !130)
!132 = !DILocation(line: 79, column: 35, scope: !130)
!133 = !DILocation(line: 79, column: 23, scope: !130)
!134 = !DILocation(line: 79, column: 9, scope: !127)
!135 = !DILocation(line: 81, column: 30, scope: !136)
!136 = distinct !DILexicalBlock(scope: !130, file: !16, line: 80, column: 9)
!137 = !DILocation(line: 81, column: 23, scope: !136)
!138 = !DILocation(line: 81, column: 13, scope: !136)
!139 = !DILocation(line: 81, column: 18, scope: !136)
!140 = !DILocation(line: 81, column: 21, scope: !136)
!141 = !DILocation(line: 82, column: 9, scope: !136)
!142 = !DILocation(line: 79, column: 41, scope: !130)
!143 = !DILocation(line: 79, column: 9, scope: !130)
!144 = distinct !{!144, !134, !145, !71}
!145 = !DILocation(line: 82, column: 9, scope: !127)
!146 = !DILocation(line: 83, column: 20, scope: !117)
!147 = !DILocation(line: 83, column: 9, scope: !117)
!148 = !DILocation(line: 85, column: 1, scope: !98)
