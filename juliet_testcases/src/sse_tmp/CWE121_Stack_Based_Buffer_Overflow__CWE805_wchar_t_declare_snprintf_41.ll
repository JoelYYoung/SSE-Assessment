; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !28
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %0 = load i32*, i32** %data.addr, align 8, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !32
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %0, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay1) #4, !dbg !33
  %1 = load i32*, i32** %data.addr, align 8, !dbg !34
  call void @printWLine(i32* %1), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !49
  store i32* %arraydecay, i32** %data, align 8, !dbg !50
  %0 = load i32*, i32** %data, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !52
  %1 = load i32*, i32** %data, align 8, !dbg !53
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_badSink(i32* %1), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_goodG2BSink(i32* %data) #0 !dbg !56 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !63
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx, align 4, !dbg !65
  %0 = load i32*, i32** %data.addr, align 8, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !67
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %0, i64 100, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %arraydecay1) #4, !dbg !68
  %1 = load i32*, i32** %data.addr, align 8, !dbg !69
  call void @printWLine(i32* %1), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_good() #0 !dbg !72 {
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
  %call = call i64 @time(i64* null) #4, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #4, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i32* %arraydecay, i32** %data, align 8, !dbg !103
  %0 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_goodG2BSink(i32* %1), !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_badSink", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 29, type: !15)
!20 = !DILocation(line: 29, column: 95, scope: !11)
!21 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 32, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 32, column: 17, scope: !22)
!27 = !DILocation(line: 33, column: 17, scope: !22)
!28 = !DILocation(line: 33, column: 9, scope: !22)
!29 = !DILocation(line: 34, column: 9, scope: !22)
!30 = !DILocation(line: 34, column: 23, scope: !22)
!31 = !DILocation(line: 36, column: 18, scope: !22)
!32 = !DILocation(line: 36, column: 36, scope: !22)
!33 = !DILocation(line: 36, column: 9, scope: !22)
!34 = !DILocation(line: 37, column: 20, scope: !22)
!35 = !DILocation(line: 37, column: 9, scope: !22)
!36 = !DILocation(line: 39, column: 1, scope: !11)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_bad", scope: !12, file: !12, line: 41, type: !38, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 43, type: !15)
!41 = !DILocation(line: 43, column: 15, scope: !37)
!42 = !DILocalVariable(name: "dataBadBuffer", scope: !37, file: !12, line: 44, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 44, column: 13, scope: !37)
!47 = !DILocalVariable(name: "dataGoodBuffer", scope: !37, file: !12, line: 45, type: !23)
!48 = !DILocation(line: 45, column: 13, scope: !37)
!49 = !DILocation(line: 48, column: 12, scope: !37)
!50 = !DILocation(line: 48, column: 10, scope: !37)
!51 = !DILocation(line: 49, column: 5, scope: !37)
!52 = !DILocation(line: 49, column: 13, scope: !37)
!53 = !DILocation(line: 50, column: 84, scope: !37)
!54 = !DILocation(line: 50, column: 5, scope: !37)
!55 = !DILocation(line: 51, column: 1, scope: !37)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_goodG2BSink", scope: !12, file: !12, line: 57, type: !13, scopeLine: 58, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocalVariable(name: "data", arg: 1, scope: !56, file: !12, line: 57, type: !15)
!58 = !DILocation(line: 57, column: 99, scope: !56)
!59 = !DILocalVariable(name: "source", scope: !60, file: !12, line: 60, type: !23)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 59, column: 5)
!61 = !DILocation(line: 60, column: 17, scope: !60)
!62 = !DILocation(line: 61, column: 17, scope: !60)
!63 = !DILocation(line: 61, column: 9, scope: !60)
!64 = !DILocation(line: 62, column: 9, scope: !60)
!65 = !DILocation(line: 62, column: 23, scope: !60)
!66 = !DILocation(line: 64, column: 18, scope: !60)
!67 = !DILocation(line: 64, column: 36, scope: !60)
!68 = !DILocation(line: 64, column: 9, scope: !60)
!69 = !DILocation(line: 65, column: 20, scope: !60)
!70 = !DILocation(line: 65, column: 9, scope: !60)
!71 = !DILocation(line: 67, column: 1, scope: !56)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_snprintf_41_good", scope: !12, file: !12, line: 81, type: !38, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 83, column: 5, scope: !72)
!74 = !DILocation(line: 84, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !76, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!18, !18, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 96, type: !18)
!82 = !DILocation(line: 96, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 96, type: !78)
!84 = !DILocation(line: 96, column: 27, scope: !75)
!85 = !DILocation(line: 99, column: 22, scope: !75)
!86 = !DILocation(line: 99, column: 12, scope: !75)
!87 = !DILocation(line: 99, column: 5, scope: !75)
!88 = !DILocation(line: 101, column: 5, scope: !75)
!89 = !DILocation(line: 102, column: 5, scope: !75)
!90 = !DILocation(line: 103, column: 5, scope: !75)
!91 = !DILocation(line: 106, column: 5, scope: !75)
!92 = !DILocation(line: 107, column: 5, scope: !75)
!93 = !DILocation(line: 108, column: 5, scope: !75)
!94 = !DILocation(line: 110, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 70, type: !38, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 72, type: !15)
!97 = !DILocation(line: 72, column: 15, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 73, type: !43)
!99 = !DILocation(line: 73, column: 13, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 74, type: !23)
!101 = !DILocation(line: 74, column: 13, scope: !95)
!102 = !DILocation(line: 76, column: 12, scope: !95)
!103 = !DILocation(line: 76, column: 10, scope: !95)
!104 = !DILocation(line: 77, column: 5, scope: !95)
!105 = !DILocation(line: 77, column: 13, scope: !95)
!106 = !DILocation(line: 78, column: 88, scope: !95)
!107 = !DILocation(line: 78, column: 5, scope: !95)
!108 = !DILocation(line: 79, column: 1, scope: !95)
