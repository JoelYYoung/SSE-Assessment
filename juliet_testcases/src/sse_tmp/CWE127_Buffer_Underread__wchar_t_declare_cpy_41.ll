; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !27
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !28
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !29
  store i32 0, i32* %arrayidx, align 4, !dbg !30
  %arraydecay1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !31
  %0 = load i32*, i32** %data.addr, align 8, !dbg !32
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %0) #4, !dbg !33
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !34
  call void @printWLine(i32* %arraydecay3), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !47
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !48
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !51
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !52
  store i32* %add.ptr, i32** %data, align 8, !dbg !53
  %0 = load i32*, i32** %data, align 8, !dbg !54
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_badSink(i32* %0), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_goodG2BSink(i32* %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !60, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !64
  %arrayidx = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  %arraydecay1 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !67
  %0 = load i32*, i32** %data.addr, align 8, !dbg !68
  %call2 = call i32* @wcscpy(i32* %arraydecay1, i32* %0) #4, !dbg !69
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !70
  call void @printWLine(i32* %arraydecay3), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #4, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #4, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !101
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !102
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx, align 4, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay1, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_41_goodG2BSink(i32* %0), !dbg !108
  ret void, !dbg !109
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_41.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!20 = !DILocation(line: 23, column: 72, scope: !11)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !12, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 200)
!26 = !DILocation(line: 26, column: 17, scope: !22)
!27 = !DILocation(line: 27, column: 17, scope: !22)
!28 = !DILocation(line: 27, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 9, scope: !22)
!30 = !DILocation(line: 28, column: 23, scope: !22)
!31 = !DILocation(line: 30, column: 16, scope: !22)
!32 = !DILocation(line: 30, column: 22, scope: !22)
!33 = !DILocation(line: 30, column: 9, scope: !22)
!34 = !DILocation(line: 31, column: 20, scope: !22)
!35 = !DILocation(line: 31, column: 9, scope: !22)
!36 = !DILocation(line: 33, column: 1, scope: !11)
!37 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_41_bad", scope: !12, file: !12, line: 35, type: !38, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 37, type: !15)
!41 = !DILocation(line: 37, column: 15, scope: !37)
!42 = !DILocalVariable(name: "dataBuffer", scope: !37, file: !12, line: 38, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 38, column: 13, scope: !37)
!47 = !DILocation(line: 39, column: 13, scope: !37)
!48 = !DILocation(line: 39, column: 5, scope: !37)
!49 = !DILocation(line: 40, column: 5, scope: !37)
!50 = !DILocation(line: 40, column: 23, scope: !37)
!51 = !DILocation(line: 42, column: 12, scope: !37)
!52 = !DILocation(line: 42, column: 23, scope: !37)
!53 = !DILocation(line: 42, column: 10, scope: !37)
!54 = !DILocation(line: 43, column: 61, scope: !37)
!55 = !DILocation(line: 43, column: 5, scope: !37)
!56 = !DILocation(line: 44, column: 1, scope: !37)
!57 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_41_goodG2BSink", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !12, line: 50, type: !15)
!59 = !DILocation(line: 50, column: 76, scope: !57)
!60 = !DILocalVariable(name: "dest", scope: !61, file: !12, line: 53, type: !23)
!61 = distinct !DILexicalBlock(scope: !57, file: !12, line: 52, column: 5)
!62 = !DILocation(line: 53, column: 17, scope: !61)
!63 = !DILocation(line: 54, column: 17, scope: !61)
!64 = !DILocation(line: 54, column: 9, scope: !61)
!65 = !DILocation(line: 55, column: 9, scope: !61)
!66 = !DILocation(line: 55, column: 23, scope: !61)
!67 = !DILocation(line: 57, column: 16, scope: !61)
!68 = !DILocation(line: 57, column: 22, scope: !61)
!69 = !DILocation(line: 57, column: 9, scope: !61)
!70 = !DILocation(line: 58, column: 20, scope: !61)
!71 = !DILocation(line: 58, column: 9, scope: !61)
!72 = !DILocation(line: 60, column: 1, scope: !57)
!73 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_41_good", scope: !12, file: !12, line: 74, type: !38, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 76, column: 5, scope: !73)
!75 = !DILocation(line: 77, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !77, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!18, !18, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 89, type: !18)
!83 = !DILocation(line: 89, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 89, type: !79)
!85 = !DILocation(line: 89, column: 27, scope: !76)
!86 = !DILocation(line: 92, column: 22, scope: !76)
!87 = !DILocation(line: 92, column: 12, scope: !76)
!88 = !DILocation(line: 92, column: 5, scope: !76)
!89 = !DILocation(line: 94, column: 5, scope: !76)
!90 = !DILocation(line: 95, column: 5, scope: !76)
!91 = !DILocation(line: 96, column: 5, scope: !76)
!92 = !DILocation(line: 99, column: 5, scope: !76)
!93 = !DILocation(line: 100, column: 5, scope: !76)
!94 = !DILocation(line: 101, column: 5, scope: !76)
!95 = !DILocation(line: 103, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !38, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 65, type: !15)
!98 = !DILocation(line: 65, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 66, type: !43)
!100 = !DILocation(line: 66, column: 13, scope: !96)
!101 = !DILocation(line: 67, column: 13, scope: !96)
!102 = !DILocation(line: 67, column: 5, scope: !96)
!103 = !DILocation(line: 68, column: 5, scope: !96)
!104 = !DILocation(line: 68, column: 23, scope: !96)
!105 = !DILocation(line: 70, column: 12, scope: !96)
!106 = !DILocation(line: 70, column: 10, scope: !96)
!107 = !DILocation(line: 71, column: 65, scope: !96)
!108 = !DILocation(line: 71, column: 5, scope: !96)
!109 = !DILocation(line: 72, column: 1, scope: !96)
