; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @badSource(i32* %0), !dbg !29
  store i32* %call, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !36
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call2 = call i64 @wcslen(i32* %2) #6, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %3) #7, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  call void @printWLine(i32* %4), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !45 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = load i32*, i32** %data.addr, align 8, !dbg !50
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #7, !dbg !51
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !52
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  %2 = load i32*, i32** %data.addr, align 8, !dbg !54
  ret i32* %2, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #7, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #7, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !84
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  %0 = load i32*, i32** %data, align 8, !dbg !86
  %call = call i32* @goodG2BSource(i32* %0), !dbg !87
  store i32* %call, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !91
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !92
  %2 = load i32*, i32** %data, align 8, !dbg !93
  %call2 = call i64 @wcslen(i32* %2) #6, !dbg !94
  %3 = load i32*, i32** %data, align 8, !dbg !95
  %call3 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay1, i64 %call2, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %3) #7, !dbg !96
  %4 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %4), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2BSource(i32* %data) #0 !dbg !100 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32*, i32** %data.addr, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #7, !dbg !104
  %1 = load i32*, i32** %data.addr, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %2 = load i32*, i32** %data.addr, align 8, !dbg !107
  ret i32* %2, !dbg !108
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 12, scope: !11)
!27 = !DILocation(line: 41, column: 10, scope: !11)
!28 = !DILocation(line: 42, column: 22, scope: !11)
!29 = !DILocation(line: 42, column: 12, scope: !11)
!30 = !DILocation(line: 42, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !12, line: 44, type: !33)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 44, column: 17, scope: !32)
!37 = !DILocation(line: 46, column: 18, scope: !32)
!38 = !DILocation(line: 46, column: 31, scope: !32)
!39 = !DILocation(line: 46, column: 24, scope: !32)
!40 = !DILocation(line: 46, column: 45, scope: !32)
!41 = !DILocation(line: 46, column: 9, scope: !32)
!42 = !DILocation(line: 47, column: 20, scope: !32)
!43 = !DILocation(line: 47, column: 9, scope: !32)
!44 = !DILocation(line: 49, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 29, type: !46, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!16, !16}
!48 = !DILocalVariable(name: "data", arg: 1, scope: !45, file: !12, line: 29, type: !16)
!49 = !DILocation(line: 29, column: 38, scope: !45)
!50 = !DILocation(line: 32, column: 13, scope: !45)
!51 = !DILocation(line: 32, column: 5, scope: !45)
!52 = !DILocation(line: 33, column: 5, scope: !45)
!53 = !DILocation(line: 33, column: 17, scope: !45)
!54 = !DILocation(line: 34, column: 12, scope: !45)
!55 = !DILocation(line: 34, column: 5, scope: !45)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_snprintf_42_good", scope: !12, file: !12, line: 78, type: !13, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DILocation(line: 80, column: 5, scope: !56)
!58 = !DILocation(line: 81, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 93, type: !60, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!19, !19, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 93, type: !19)
!66 = !DILocation(line: 93, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 93, type: !62)
!68 = !DILocation(line: 93, column: 27, scope: !59)
!69 = !DILocation(line: 96, column: 22, scope: !59)
!70 = !DILocation(line: 96, column: 12, scope: !59)
!71 = !DILocation(line: 96, column: 5, scope: !59)
!72 = !DILocation(line: 98, column: 5, scope: !59)
!73 = !DILocation(line: 99, column: 5, scope: !59)
!74 = !DILocation(line: 100, column: 5, scope: !59)
!75 = !DILocation(line: 103, column: 5, scope: !59)
!76 = !DILocation(line: 104, column: 5, scope: !59)
!77 = !DILocation(line: 105, column: 5, scope: !59)
!78 = !DILocation(line: 107, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 64, type: !13, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", scope: !79, file: !12, line: 66, type: !16)
!81 = !DILocation(line: 66, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !12, line: 67, type: !22)
!83 = !DILocation(line: 67, column: 13, scope: !79)
!84 = !DILocation(line: 68, column: 12, scope: !79)
!85 = !DILocation(line: 68, column: 10, scope: !79)
!86 = !DILocation(line: 69, column: 26, scope: !79)
!87 = !DILocation(line: 69, column: 12, scope: !79)
!88 = !DILocation(line: 69, column: 10, scope: !79)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 71, type: !33)
!90 = distinct !DILexicalBlock(scope: !79, file: !12, line: 70, column: 5)
!91 = !DILocation(line: 71, column: 17, scope: !90)
!92 = !DILocation(line: 73, column: 18, scope: !90)
!93 = !DILocation(line: 73, column: 31, scope: !90)
!94 = !DILocation(line: 73, column: 24, scope: !90)
!95 = !DILocation(line: 73, column: 45, scope: !90)
!96 = !DILocation(line: 73, column: 9, scope: !90)
!97 = !DILocation(line: 74, column: 20, scope: !90)
!98 = !DILocation(line: 74, column: 9, scope: !90)
!99 = !DILocation(line: 76, column: 1, scope: !79)
!100 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 55, type: !46, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", arg: 1, scope: !100, file: !12, line: 55, type: !16)
!102 = !DILocation(line: 55, column: 42, scope: !100)
!103 = !DILocation(line: 58, column: 13, scope: !100)
!104 = !DILocation(line: 58, column: 5, scope: !100)
!105 = !DILocation(line: 59, column: 5, scope: !100)
!106 = !DILocation(line: 59, column: 16, scope: !100)
!107 = !DILocation(line: 60, column: 12, scope: !100)
!108 = !DILocation(line: 60, column: 5, scope: !100)
