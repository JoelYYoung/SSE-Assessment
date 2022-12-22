; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
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
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx1, align 4, !dbg !45
  %6 = load i32*, i32** %data, align 8, !dbg !46
  %7 = bitcast i32* %6 to i8*, !dbg !47
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %8 = bitcast i32* %arraydecay2 to i8*, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !48
  store i32 0, i32* %arrayidx3, align 4, !dbg !49
  %10 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %10), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #5, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #5, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 200, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = alloca i8, i64 400, align 16, !dbg !85
  %3 = bitcast i8* %2 to i32*, !dbg !86
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !84
  br label %while.body, !dbg !87

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !88
  store i32* %4, i32** %data, align 8, !dbg !90
  %5 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  br label %while.end, !dbg !93

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx1, align 4, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !101
  %7 = bitcast i32* %6 to i8*, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !102
  %8 = bitcast i32* %arraydecay2 to i8*, !dbg !102
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 400, i1 false), !dbg !102
  %9 = load i32*, i32** %data, align 8, !dbg !103
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !103
  store i32 0, i32* %arrayidx3, align 4, !dbg !104
  %10 = load i32*, i32** %data, align 8, !dbg !105
  call void @printWLine(i32* %10), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 5, scope: !15)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 14, scope: !31)
!33 = !DILocation(line: 33, column: 9, scope: !31)
!34 = !DILocation(line: 33, column: 17, scope: !31)
!35 = !DILocation(line: 34, column: 9, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !16, line: 37, type: !38)
!37 = distinct !DILexicalBlock(scope: !15, file: !16, line: 36, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 37, column: 17, scope: !37)
!42 = !DILocation(line: 38, column: 17, scope: !37)
!43 = !DILocation(line: 38, column: 9, scope: !37)
!44 = !DILocation(line: 39, column: 9, scope: !37)
!45 = !DILocation(line: 39, column: 23, scope: !37)
!46 = !DILocation(line: 41, column: 17, scope: !37)
!47 = !DILocation(line: 41, column: 9, scope: !37)
!48 = !DILocation(line: 42, column: 9, scope: !37)
!49 = !DILocation(line: 42, column: 21, scope: !37)
!50 = !DILocation(line: 43, column: 20, scope: !37)
!51 = !DILocation(line: 43, column: 9, scope: !37)
!52 = !DILocation(line: 45, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_16_good", scope: !16, file: !16, line: 75, type: !17, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 77, column: 5, scope: !53)
!55 = !DILocation(line: 78, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 90, type: !57, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !16, line: 90, type: !7)
!63 = !DILocation(line: 90, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !16, line: 90, type: !59)
!65 = !DILocation(line: 90, column: 27, scope: !56)
!66 = !DILocation(line: 93, column: 22, scope: !56)
!67 = !DILocation(line: 93, column: 12, scope: !56)
!68 = !DILocation(line: 93, column: 5, scope: !56)
!69 = !DILocation(line: 95, column: 5, scope: !56)
!70 = !DILocation(line: 96, column: 5, scope: !56)
!71 = !DILocation(line: 97, column: 5, scope: !56)
!72 = !DILocation(line: 100, column: 5, scope: !56)
!73 = !DILocation(line: 101, column: 5, scope: !56)
!74 = !DILocation(line: 102, column: 5, scope: !56)
!75 = !DILocation(line: 104, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 52, type: !17, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 54, type: !4)
!78 = !DILocation(line: 54, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !16, line: 55, type: !4)
!80 = !DILocation(line: 55, column: 15, scope: !76)
!81 = !DILocation(line: 55, column: 42, scope: !76)
!82 = !DILocation(line: 55, column: 31, scope: !76)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !16, line: 56, type: !4)
!84 = !DILocation(line: 56, column: 15, scope: !76)
!85 = !DILocation(line: 56, column: 43, scope: !76)
!86 = !DILocation(line: 56, column: 32, scope: !76)
!87 = !DILocation(line: 57, column: 5, scope: !76)
!88 = !DILocation(line: 60, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !76, file: !16, line: 58, column: 5)
!90 = !DILocation(line: 60, column: 14, scope: !89)
!91 = !DILocation(line: 61, column: 9, scope: !89)
!92 = !DILocation(line: 61, column: 17, scope: !89)
!93 = !DILocation(line: 62, column: 9, scope: !89)
!94 = !DILocalVariable(name: "source", scope: !95, file: !16, line: 65, type: !38)
!95 = distinct !DILexicalBlock(scope: !76, file: !16, line: 64, column: 5)
!96 = !DILocation(line: 65, column: 17, scope: !95)
!97 = !DILocation(line: 66, column: 17, scope: !95)
!98 = !DILocation(line: 66, column: 9, scope: !95)
!99 = !DILocation(line: 67, column: 9, scope: !95)
!100 = !DILocation(line: 67, column: 23, scope: !95)
!101 = !DILocation(line: 69, column: 17, scope: !95)
!102 = !DILocation(line: 69, column: 9, scope: !95)
!103 = !DILocation(line: 70, column: 9, scope: !95)
!104 = !DILocation(line: 70, column: 21, scope: !95)
!105 = !DILocation(line: 71, column: 20, scope: !95)
!106 = !DILocation(line: 71, column: 9, scope: !95)
!107 = !DILocation(line: 73, column: 1, scope: !76)
