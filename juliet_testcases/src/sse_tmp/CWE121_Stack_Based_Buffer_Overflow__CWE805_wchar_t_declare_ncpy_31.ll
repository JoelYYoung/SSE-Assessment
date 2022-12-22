; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %1, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %2, i32** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !46
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx3, align 4, !dbg !48
  %3 = load i32*, i32** %data1, align 8, !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !50
  %call5 = call i32* @wcsncpy(i32* %3, i32* %arraydecay4, i64 99) #4, !dbg !51
  %4 = load i32*, i32** %data1, align 8, !dbg !52
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !52
  store i32 0, i32* %arrayidx6, align 4, !dbg !53
  %5 = load i32*, i32** %data1, align 8, !dbg !54
  call void @printWLine(i32* %5), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #4, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #4, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  %0 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !89
  store i32 0, i32* %arrayidx, align 4, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !91, metadata !DIExpression()), !dbg !93
  %1 = load i32*, i32** %data, align 8, !dbg !94
  store i32* %1, i32** %dataCopy, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = load i32*, i32** %dataCopy, align 8, !dbg !97
  store i32* %2, i32** %data1, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !102
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx3, align 4, !dbg !104
  %3 = load i32*, i32** %data1, align 8, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !106
  %call5 = call i32* @wcsncpy(i32* %3, i32* %arraydecay4, i64 99) #4, !dbg !107
  %4 = load i32*, i32** %data1, align 8, !dbg !108
  %arrayidx6 = getelementptr inbounds i32, i32* %4, i64 99, !dbg !108
  store i32 0, i32* %arrayidx6, align 4, !dbg !109
  %5 = load i32*, i32** %data1, align 8, !dbg !110
  call void @printWLine(i32* %5), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 30, column: 12, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !12, line: 33, type: !16)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!37 = !DILocation(line: 33, column: 19, scope: !36)
!38 = !DILocation(line: 33, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 34, type: !16)
!40 = !DILocation(line: 34, column: 19, scope: !36)
!41 = !DILocation(line: 34, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !12, line: 36, type: !27)
!43 = distinct !DILexicalBlock(scope: !36, file: !12, line: 35, column: 9)
!44 = !DILocation(line: 36, column: 21, scope: !43)
!45 = !DILocation(line: 37, column: 21, scope: !43)
!46 = !DILocation(line: 37, column: 13, scope: !43)
!47 = !DILocation(line: 38, column: 13, scope: !43)
!48 = !DILocation(line: 38, column: 27, scope: !43)
!49 = !DILocation(line: 40, column: 21, scope: !43)
!50 = !DILocation(line: 40, column: 27, scope: !43)
!51 = !DILocation(line: 40, column: 13, scope: !43)
!52 = !DILocation(line: 41, column: 13, scope: !43)
!53 = !DILocation(line: 41, column: 25, scope: !43)
!54 = !DILocation(line: 42, column: 24, scope: !43)
!55 = !DILocation(line: 42, column: 13, scope: !43)
!56 = !DILocation(line: 45, column: 1, scope: !11)
!57 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_31_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocation(line: 77, column: 5, scope: !57)
!59 = !DILocation(line: 78, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !61, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{!19, !19, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !12, line: 89, type: !19)
!67 = !DILocation(line: 89, column: 14, scope: !60)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !12, line: 89, type: !63)
!69 = !DILocation(line: 89, column: 27, scope: !60)
!70 = !DILocation(line: 92, column: 22, scope: !60)
!71 = !DILocation(line: 92, column: 12, scope: !60)
!72 = !DILocation(line: 92, column: 5, scope: !60)
!73 = !DILocation(line: 94, column: 5, scope: !60)
!74 = !DILocation(line: 95, column: 5, scope: !60)
!75 = !DILocation(line: 96, column: 5, scope: !60)
!76 = !DILocation(line: 99, column: 5, scope: !60)
!77 = !DILocation(line: 100, column: 5, scope: !60)
!78 = !DILocation(line: 101, column: 5, scope: !60)
!79 = !DILocation(line: 103, column: 5, scope: !60)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "data", scope: !80, file: !12, line: 54, type: !16)
!82 = !DILocation(line: 54, column: 15, scope: !80)
!83 = !DILocalVariable(name: "dataBadBuffer", scope: !80, file: !12, line: 55, type: !22)
!84 = !DILocation(line: 55, column: 13, scope: !80)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !80, file: !12, line: 56, type: !27)
!86 = !DILocation(line: 56, column: 13, scope: !80)
!87 = !DILocation(line: 58, column: 12, scope: !80)
!88 = !DILocation(line: 58, column: 10, scope: !80)
!89 = !DILocation(line: 59, column: 5, scope: !80)
!90 = !DILocation(line: 59, column: 13, scope: !80)
!91 = !DILocalVariable(name: "dataCopy", scope: !92, file: !12, line: 61, type: !16)
!92 = distinct !DILexicalBlock(scope: !80, file: !12, line: 60, column: 5)
!93 = !DILocation(line: 61, column: 19, scope: !92)
!94 = !DILocation(line: 61, column: 30, scope: !92)
!95 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 62, type: !16)
!96 = !DILocation(line: 62, column: 19, scope: !92)
!97 = !DILocation(line: 62, column: 26, scope: !92)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 64, type: !27)
!99 = distinct !DILexicalBlock(scope: !92, file: !12, line: 63, column: 9)
!100 = !DILocation(line: 64, column: 21, scope: !99)
!101 = !DILocation(line: 65, column: 21, scope: !99)
!102 = !DILocation(line: 65, column: 13, scope: !99)
!103 = !DILocation(line: 66, column: 13, scope: !99)
!104 = !DILocation(line: 66, column: 27, scope: !99)
!105 = !DILocation(line: 68, column: 21, scope: !99)
!106 = !DILocation(line: 68, column: 27, scope: !99)
!107 = !DILocation(line: 68, column: 13, scope: !99)
!108 = !DILocation(line: 69, column: 13, scope: !99)
!109 = !DILocation(line: 69, column: 25, scope: !99)
!110 = !DILocation(line: 70, column: 24, scope: !99)
!111 = !DILocation(line: 70, column: 13, scope: !99)
!112 = !DILocation(line: 73, column: 1, scope: !80)
