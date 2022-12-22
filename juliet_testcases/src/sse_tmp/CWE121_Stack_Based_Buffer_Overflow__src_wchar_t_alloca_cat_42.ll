; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  %3 = load i32*, i32** %data, align 8, !dbg !27
  %call = call i32* @badSource(i32* %3), !dbg !28
  store i32* %call, i32** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  call void @printWLine(i32* %6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32*, i32** %data.addr, align 8, !dbg !47
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #5, !dbg !48
  %1 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %2 = load i32*, i32** %data.addr, align 8, !dbg !51
  ret i32* %2, !dbg !52
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42_good() #0 !dbg !53 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %2, i32** %data, align 8, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %call = call i32* @goodG2BSource(i32* %3), !dbg !86
  store i32* %call, i32** %data, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !93
  %6 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* %6), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !97 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i32*, i32** %data.addr, align 8, !dbg !100
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #5, !dbg !101
  %1 = load i32*, i32** %data.addr, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  %2 = load i32*, i32** %data.addr, align 8, !dbg !104
  ret i32* %2, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42_bad", scope: !16, file: !16, line: 31, type: !17, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 33, type: !4)
!20 = !DILocation(line: 33, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 34, type: !4)
!22 = !DILocation(line: 34, column: 15, scope: !15)
!23 = !DILocation(line: 34, column: 39, scope: !15)
!24 = !DILocation(line: 34, column: 28, scope: !15)
!25 = !DILocation(line: 35, column: 12, scope: !15)
!26 = !DILocation(line: 35, column: 10, scope: !15)
!27 = !DILocation(line: 36, column: 22, scope: !15)
!28 = !DILocation(line: 36, column: 12, scope: !15)
!29 = !DILocation(line: 36, column: 10, scope: !15)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !16, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 38, column: 17, scope: !31)
!36 = !DILocation(line: 40, column: 16, scope: !31)
!37 = !DILocation(line: 40, column: 22, scope: !31)
!38 = !DILocation(line: 40, column: 9, scope: !31)
!39 = !DILocation(line: 41, column: 20, scope: !31)
!40 = !DILocation(line: 41, column: 9, scope: !31)
!41 = !DILocation(line: 43, column: 1, scope: !15)
!42 = distinct !DISubprogram(name: "badSource", scope: !16, file: !16, line: 23, type: !43, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DISubroutineType(types: !44)
!44 = !{!4, !4}
!45 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !16, line: 23, type: !4)
!46 = !DILocation(line: 23, column: 38, scope: !42)
!47 = !DILocation(line: 26, column: 13, scope: !42)
!48 = !DILocation(line: 26, column: 5, scope: !42)
!49 = !DILocation(line: 27, column: 5, scope: !42)
!50 = !DILocation(line: 27, column: 17, scope: !42)
!51 = !DILocation(line: 28, column: 12, scope: !42)
!52 = !DILocation(line: 28, column: 5, scope: !42)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_42_good", scope: !16, file: !16, line: 72, type: !17, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 74, column: 5, scope: !53)
!55 = !DILocation(line: 75, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 87, type: !57, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!7, !7, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !16, line: 87, type: !7)
!63 = !DILocation(line: 87, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !16, line: 87, type: !59)
!65 = !DILocation(line: 87, column: 27, scope: !56)
!66 = !DILocation(line: 90, column: 22, scope: !56)
!67 = !DILocation(line: 90, column: 12, scope: !56)
!68 = !DILocation(line: 90, column: 5, scope: !56)
!69 = !DILocation(line: 92, column: 5, scope: !56)
!70 = !DILocation(line: 93, column: 5, scope: !56)
!71 = !DILocation(line: 94, column: 5, scope: !56)
!72 = !DILocation(line: 97, column: 5, scope: !56)
!73 = !DILocation(line: 98, column: 5, scope: !56)
!74 = !DILocation(line: 99, column: 5, scope: !56)
!75 = !DILocation(line: 101, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 58, type: !17, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !16, line: 60, type: !4)
!78 = !DILocation(line: 60, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !16, line: 61, type: !4)
!80 = !DILocation(line: 61, column: 15, scope: !76)
!81 = !DILocation(line: 61, column: 39, scope: !76)
!82 = !DILocation(line: 61, column: 28, scope: !76)
!83 = !DILocation(line: 62, column: 12, scope: !76)
!84 = !DILocation(line: 62, column: 10, scope: !76)
!85 = !DILocation(line: 63, column: 26, scope: !76)
!86 = !DILocation(line: 63, column: 12, scope: !76)
!87 = !DILocation(line: 63, column: 10, scope: !76)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !16, line: 65, type: !32)
!89 = distinct !DILexicalBlock(scope: !76, file: !16, line: 64, column: 5)
!90 = !DILocation(line: 65, column: 17, scope: !89)
!91 = !DILocation(line: 67, column: 16, scope: !89)
!92 = !DILocation(line: 67, column: 22, scope: !89)
!93 = !DILocation(line: 67, column: 9, scope: !89)
!94 = !DILocation(line: 68, column: 20, scope: !89)
!95 = !DILocation(line: 68, column: 9, scope: !89)
!96 = !DILocation(line: 70, column: 1, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2BSource", scope: !16, file: !16, line: 49, type: !43, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", arg: 1, scope: !97, file: !16, line: 49, type: !4)
!99 = !DILocation(line: 49, column: 42, scope: !97)
!100 = !DILocation(line: 52, column: 13, scope: !97)
!101 = !DILocation(line: 52, column: 5, scope: !97)
!102 = !DILocation(line: 53, column: 5, scope: !97)
!103 = !DILocation(line: 53, column: 16, scope: !97)
!104 = !DILocation(line: 54, column: 12, scope: !97)
!105 = !DILocation(line: 54, column: 5, scope: !97)
