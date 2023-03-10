; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_31.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !31
  store i32* %add.ptr, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %0, i32** %dataCopy, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !37, metadata !DIExpression()), !dbg !38
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !39
  store i32* %1, i32** %data2, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !46
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 199) #4, !dbg !47
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !48
  store i32 0, i32* %arrayidx5, align 4, !dbg !49
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !50
  %2 = load i32*, i32** %data2, align 8, !dbg !51
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %2) #4, !dbg !52
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !53
  call void @printWLine(i32* %arraydecay8), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_cpy_31_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #4, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #4, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_31_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE127_Buffer_Underread__wchar_t_declare_cpy_31_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !85
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i32* %arraydecay1, i32** %data, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !90, metadata !DIExpression()), !dbg !92
  %0 = load i32*, i32** %data, align 8, !dbg !93
  store i32* %0, i32** %dataCopy, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !94, metadata !DIExpression()), !dbg !95
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !96
  store i32* %1, i32** %data2, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !100
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 199) #4, !dbg !101
  %arrayidx5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !102
  store i32 0, i32* %arrayidx5, align 4, !dbg !103
  %arraydecay6 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !104
  %2 = load i32*, i32** %data2, align 8, !dbg !105
  %call7 = call i32* @wcscpy(i32* %arraydecay6, i32* %2) #4, !dbg !106
  %arraydecay8 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !107
  call void @printWLine(i32* %arraydecay8), !dbg !108
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_cpy_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 30, column: 12, scope: !11)
!31 = !DILocation(line: 30, column: 23, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocalVariable(name: "dataCopy", scope: !34, file: !12, line: 32, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!35 = !DILocation(line: 32, column: 19, scope: !34)
!36 = !DILocation(line: 32, column: 30, scope: !34)
!37 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 33, type: !16)
!38 = !DILocation(line: 33, column: 19, scope: !34)
!39 = !DILocation(line: 33, column: 26, scope: !34)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 35, type: !42)
!41 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 9)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 200)
!45 = !DILocation(line: 35, column: 21, scope: !41)
!46 = !DILocation(line: 36, column: 21, scope: !41)
!47 = !DILocation(line: 36, column: 13, scope: !41)
!48 = !DILocation(line: 37, column: 13, scope: !41)
!49 = !DILocation(line: 37, column: 27, scope: !41)
!50 = !DILocation(line: 39, column: 20, scope: !41)
!51 = !DILocation(line: 39, column: 26, scope: !41)
!52 = !DILocation(line: 39, column: 13, scope: !41)
!53 = !DILocation(line: 40, column: 24, scope: !41)
!54 = !DILocation(line: 40, column: 13, scope: !41)
!55 = !DILocation(line: 43, column: 1, scope: !11)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_cpy_31_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 74, column: 5, scope: !56)
!58 = !DILocation(line: 75, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !60, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 86, type: !19)
!66 = !DILocation(line: 86, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 86, type: !62)
!68 = !DILocation(line: 86, column: 27, scope: !59)
!69 = !DILocation(line: 89, column: 22, scope: !59)
!70 = !DILocation(line: 89, column: 12, scope: !59)
!71 = !DILocation(line: 89, column: 5, scope: !59)
!72 = !DILocation(line: 91, column: 5, scope: !59)
!73 = !DILocation(line: 92, column: 5, scope: !59)
!74 = !DILocation(line: 93, column: 5, scope: !59)
!75 = !DILocation(line: 96, column: 5, scope: !59)
!76 = !DILocation(line: 97, column: 5, scope: !59)
!77 = !DILocation(line: 98, column: 5, scope: !59)
!78 = !DILocation(line: 100, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 52, type: !16)
!81 = !DILocation(line: 52, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 53, type: !22)
!83 = !DILocation(line: 53, column: 13, scope: !79)
!84 = !DILocation(line: 54, column: 13, scope: !79)
!85 = !DILocation(line: 54, column: 5, scope: !79)
!86 = !DILocation(line: 55, column: 5, scope: !79)
!87 = !DILocation(line: 55, column: 23, scope: !79)
!88 = !DILocation(line: 57, column: 12, scope: !79)
!89 = !DILocation(line: 57, column: 10, scope: !79)
!90 = !DILocalVariable(name: "dataCopy", scope: !91, file: !12, line: 59, type: !16)
!91 = distinct !DILexicalBlock(scope: !79, file: !12, line: 58, column: 5)
!92 = !DILocation(line: 59, column: 19, scope: !91)
!93 = !DILocation(line: 59, column: 30, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 60, type: !16)
!95 = !DILocation(line: 60, column: 19, scope: !91)
!96 = !DILocation(line: 60, column: 26, scope: !91)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !12, line: 62, type: !42)
!98 = distinct !DILexicalBlock(scope: !91, file: !12, line: 61, column: 9)
!99 = !DILocation(line: 62, column: 21, scope: !98)
!100 = !DILocation(line: 63, column: 21, scope: !98)
!101 = !DILocation(line: 63, column: 13, scope: !98)
!102 = !DILocation(line: 64, column: 13, scope: !98)
!103 = !DILocation(line: 64, column: 27, scope: !98)
!104 = !DILocation(line: 66, column: 20, scope: !98)
!105 = !DILocation(line: 66, column: 26, scope: !98)
!106 = !DILocation(line: 66, column: 13, scope: !98)
!107 = !DILocation(line: 67, column: 24, scope: !98)
!108 = !DILocation(line: 67, column: 13, scope: !98)
!109 = !DILocation(line: 70, column: 1, scope: !79)
