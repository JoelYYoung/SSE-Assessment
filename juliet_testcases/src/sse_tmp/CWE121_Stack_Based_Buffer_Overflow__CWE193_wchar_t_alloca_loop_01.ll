; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad() #0 !dbg !15 {
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
  store i32* %4, i32** %data, align 8, !dbg !30
  %5 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad.source to i8*), i64 44, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !46
  store i64 %call, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !51
  %8 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %8, 1, !dbg !54
  %cmp = icmp ult i64 %7, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !59
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !59
  %11 = load i32*, i32** %data, align 8, !dbg !60
  %12 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !60
  store i32 %10, i32* %arrayidx2, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %13, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %14), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #7, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #7, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 40, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = alloca i8, i64 44, align 16, !dbg !104
  %3 = bitcast i8* %2 to i32*, !dbg !105
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !103
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !106
  store i32* %4, i32** %data, align 8, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !117
  %call = call i64 @wcslen(i32* %arraydecay) #6, !dbg !118
  store i64 %call, i64* %sourceLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !123
  %8 = load i64, i64* %sourceLen, align 8, !dbg !125
  %add = add i64 %8, 1, !dbg !126
  %cmp = icmp ult i64 %7, %add, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !131
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !131
  %11 = load i32*, i32** %data, align 8, !dbg !132
  %12 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !132
  store i32 %10, i32* %arrayidx2, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %13, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %14), !dbg !141
  ret void, !dbg !142
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 35, column: 12, scope: !15)
!30 = !DILocation(line: 35, column: 10, scope: !15)
!31 = !DILocation(line: 36, column: 5, scope: !15)
!32 = !DILocation(line: 36, column: 13, scope: !15)
!33 = !DILocalVariable(name: "source", scope: !34, file: !16, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 38, column: 17, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !16, line: 39, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 39, column: 16, scope: !34)
!43 = !DILocalVariable(name: "sourceLen", scope: !34, file: !16, line: 39, type: !40)
!44 = !DILocation(line: 39, column: 19, scope: !34)
!45 = !DILocation(line: 40, column: 28, scope: !34)
!46 = !DILocation(line: 40, column: 21, scope: !34)
!47 = !DILocation(line: 40, column: 19, scope: !34)
!48 = !DILocation(line: 43, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !34, file: !16, line: 43, column: 9)
!50 = !DILocation(line: 43, column: 14, scope: !49)
!51 = !DILocation(line: 43, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !16, line: 43, column: 9)
!53 = !DILocation(line: 43, column: 25, scope: !52)
!54 = !DILocation(line: 43, column: 35, scope: !52)
!55 = !DILocation(line: 43, column: 23, scope: !52)
!56 = !DILocation(line: 43, column: 9, scope: !49)
!57 = !DILocation(line: 45, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !16, line: 44, column: 9)
!59 = !DILocation(line: 45, column: 23, scope: !58)
!60 = !DILocation(line: 45, column: 13, scope: !58)
!61 = !DILocation(line: 45, column: 18, scope: !58)
!62 = !DILocation(line: 45, column: 21, scope: !58)
!63 = !DILocation(line: 46, column: 9, scope: !58)
!64 = !DILocation(line: 43, column: 41, scope: !52)
!65 = !DILocation(line: 43, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 46, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 47, column: 20, scope: !34)
!70 = !DILocation(line: 47, column: 9, scope: !34)
!71 = !DILocation(line: 49, column: 1, scope: !15)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_01_good", scope: !16, file: !16, line: 79, type: !17, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 81, column: 5, scope: !72)
!74 = !DILocation(line: 82, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 94, type: !76, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!7, !7, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !16, line: 94, type: !7)
!82 = !DILocation(line: 94, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !16, line: 94, type: !78)
!84 = !DILocation(line: 94, column: 27, scope: !75)
!85 = !DILocation(line: 97, column: 22, scope: !75)
!86 = !DILocation(line: 97, column: 12, scope: !75)
!87 = !DILocation(line: 97, column: 5, scope: !75)
!88 = !DILocation(line: 99, column: 5, scope: !75)
!89 = !DILocation(line: 100, column: 5, scope: !75)
!90 = !DILocation(line: 101, column: 5, scope: !75)
!91 = !DILocation(line: 104, column: 5, scope: !75)
!92 = !DILocation(line: 105, column: 5, scope: !75)
!93 = !DILocation(line: 106, column: 5, scope: !75)
!94 = !DILocation(line: 108, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !16, line: 58, type: !4)
!97 = !DILocation(line: 58, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !16, line: 59, type: !4)
!99 = !DILocation(line: 59, column: 15, scope: !95)
!100 = !DILocation(line: 59, column: 42, scope: !95)
!101 = !DILocation(line: 59, column: 31, scope: !95)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !16, line: 60, type: !4)
!103 = !DILocation(line: 60, column: 15, scope: !95)
!104 = !DILocation(line: 60, column: 43, scope: !95)
!105 = !DILocation(line: 60, column: 32, scope: !95)
!106 = !DILocation(line: 63, column: 12, scope: !95)
!107 = !DILocation(line: 63, column: 10, scope: !95)
!108 = !DILocation(line: 64, column: 5, scope: !95)
!109 = !DILocation(line: 64, column: 13, scope: !95)
!110 = !DILocalVariable(name: "source", scope: !111, file: !16, line: 66, type: !35)
!111 = distinct !DILexicalBlock(scope: !95, file: !16, line: 65, column: 5)
!112 = !DILocation(line: 66, column: 17, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !16, line: 67, type: !40)
!114 = !DILocation(line: 67, column: 16, scope: !111)
!115 = !DILocalVariable(name: "sourceLen", scope: !111, file: !16, line: 67, type: !40)
!116 = !DILocation(line: 67, column: 19, scope: !111)
!117 = !DILocation(line: 68, column: 28, scope: !111)
!118 = !DILocation(line: 68, column: 21, scope: !111)
!119 = !DILocation(line: 68, column: 19, scope: !111)
!120 = !DILocation(line: 71, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !16, line: 71, column: 9)
!122 = !DILocation(line: 71, column: 14, scope: !121)
!123 = !DILocation(line: 71, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !16, line: 71, column: 9)
!125 = !DILocation(line: 71, column: 25, scope: !124)
!126 = !DILocation(line: 71, column: 35, scope: !124)
!127 = !DILocation(line: 71, column: 23, scope: !124)
!128 = !DILocation(line: 71, column: 9, scope: !121)
!129 = !DILocation(line: 73, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !16, line: 72, column: 9)
!131 = !DILocation(line: 73, column: 23, scope: !130)
!132 = !DILocation(line: 73, column: 13, scope: !130)
!133 = !DILocation(line: 73, column: 18, scope: !130)
!134 = !DILocation(line: 73, column: 21, scope: !130)
!135 = !DILocation(line: 74, column: 9, scope: !130)
!136 = !DILocation(line: 71, column: 41, scope: !124)
!137 = !DILocation(line: 71, column: 9, scope: !124)
!138 = distinct !{!138, !128, !139, !68}
!139 = !DILocation(line: 74, column: 9, scope: !121)
!140 = !DILocation(line: 75, column: 20, scope: !111)
!141 = !DILocation(line: 75, column: 9, scope: !111)
!142 = !DILocation(line: 77, column: 1, scope: !95)
