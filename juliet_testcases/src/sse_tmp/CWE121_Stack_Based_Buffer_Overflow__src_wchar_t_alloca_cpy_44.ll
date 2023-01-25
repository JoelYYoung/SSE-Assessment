; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  store i32* %2, i32** %data, align 8, !dbg !31
  %3 = load i32*, i32** %data, align 8, !dbg !32
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !33
  %4 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !36
  %6 = load i32*, i32** %data, align 8, !dbg !37
  call void %5(i32* %6), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i32* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !48
  %1 = load i32*, i32** %data.addr, align 8, !dbg !49
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %1) #5, !dbg !50
  %2 = load i32*, i32** %data.addr, align 8, !dbg !51
  call void @printWLine(i32* %2), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  store i32* %2, i32** %data, align 8, !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !89
  %4 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %5 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !92
  %6 = load i32*, i32** %data, align 8, !dbg !93
  call void %5(i32* %6), !dbg !92
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i32* %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !101
  %1 = load i32*, i32** %data.addr, align 8, !dbg !102
  %call = call i32* @wcscpy(i32* %arraydecay, i32* %1) #5, !dbg !103
  %2 = load i32*, i32** %data.addr, align 8, !dbg !104
  call void @printWLine(i32* %2), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44_bad", scope: !16, file: !16, line: 33, type: !17, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 35, type: !4)
!20 = !DILocation(line: 35, column: 15, scope: !15)
!21 = !DILocalVariable(name: "funcPtr", scope: !15, file: !16, line: 37, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !4}
!25 = !DILocation(line: 37, column: 12, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 38, type: !4)
!27 = !DILocation(line: 38, column: 15, scope: !15)
!28 = !DILocation(line: 38, column: 39, scope: !15)
!29 = !DILocation(line: 38, column: 28, scope: !15)
!30 = !DILocation(line: 39, column: 12, scope: !15)
!31 = !DILocation(line: 39, column: 10, scope: !15)
!32 = !DILocation(line: 41, column: 13, scope: !15)
!33 = !DILocation(line: 41, column: 5, scope: !15)
!34 = !DILocation(line: 42, column: 5, scope: !15)
!35 = !DILocation(line: 42, column: 17, scope: !15)
!36 = !DILocation(line: 44, column: 5, scope: !15)
!37 = !DILocation(line: 44, column: 13, scope: !15)
!38 = !DILocation(line: 45, column: 1, scope: !15)
!39 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !16, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 31, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !16, line: 26, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !16, line: 25, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 26, column: 17, scope: !43)
!48 = !DILocation(line: 28, column: 16, scope: !43)
!49 = !DILocation(line: 28, column: 22, scope: !43)
!50 = !DILocation(line: 28, column: 9, scope: !43)
!51 = !DILocation(line: 29, column: 20, scope: !43)
!52 = !DILocation(line: 29, column: 9, scope: !43)
!53 = !DILocation(line: 31, column: 1, scope: !39)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_44_good", scope: !16, file: !16, line: 74, type: !17, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 76, column: 5, scope: !54)
!56 = !DILocation(line: 77, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 88, type: !58, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 88, type: !7)
!64 = !DILocation(line: 88, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 88, type: !60)
!66 = !DILocation(line: 88, column: 27, scope: !57)
!67 = !DILocation(line: 91, column: 22, scope: !57)
!68 = !DILocation(line: 91, column: 12, scope: !57)
!69 = !DILocation(line: 91, column: 5, scope: !57)
!70 = !DILocation(line: 93, column: 5, scope: !57)
!71 = !DILocation(line: 94, column: 5, scope: !57)
!72 = !DILocation(line: 95, column: 5, scope: !57)
!73 = !DILocation(line: 98, column: 5, scope: !57)
!74 = !DILocation(line: 99, column: 5, scope: !57)
!75 = !DILocation(line: 100, column: 5, scope: !57)
!76 = !DILocation(line: 102, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 62, type: !17, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !16, line: 64, type: !4)
!79 = !DILocation(line: 64, column: 15, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !16, line: 65, type: !22)
!81 = !DILocation(line: 65, column: 12, scope: !77)
!82 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !16, line: 66, type: !4)
!83 = !DILocation(line: 66, column: 15, scope: !77)
!84 = !DILocation(line: 66, column: 39, scope: !77)
!85 = !DILocation(line: 66, column: 28, scope: !77)
!86 = !DILocation(line: 67, column: 12, scope: !77)
!87 = !DILocation(line: 67, column: 10, scope: !77)
!88 = !DILocation(line: 69, column: 13, scope: !77)
!89 = !DILocation(line: 69, column: 5, scope: !77)
!90 = !DILocation(line: 70, column: 5, scope: !77)
!91 = !DILocation(line: 70, column: 16, scope: !77)
!92 = !DILocation(line: 71, column: 5, scope: !77)
!93 = !DILocation(line: 71, column: 13, scope: !77)
!94 = !DILocation(line: 72, column: 1, scope: !77)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 52, type: !23, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !16, line: 52, type: !4)
!97 = !DILocation(line: 52, column: 35, scope: !95)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !16, line: 55, type: !44)
!99 = distinct !DILexicalBlock(scope: !95, file: !16, line: 54, column: 5)
!100 = !DILocation(line: 55, column: 17, scope: !99)
!101 = !DILocation(line: 57, column: 16, scope: !99)
!102 = !DILocation(line: 57, column: 22, scope: !99)
!103 = !DILocation(line: 57, column: 9, scope: !99)
!104 = !DILocation(line: 58, column: 20, scope: !99)
!105 = !DILocation(line: 58, column: 9, scope: !99)
!106 = !DILocation(line: 60, column: 1, scope: !95)
