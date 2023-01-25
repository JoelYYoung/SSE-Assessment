; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @globalFive, align 4, !dbg !15
  %cmp = icmp eq i32 %0, 5, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !19, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !35
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !38
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !38
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !38
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  call void @printWLine(i32* %arraydecay3), !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14_good() #0 !dbg !43 {
entry:
  call void @good1(), !dbg !44
  call void @good2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* null) #5, !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 %conv) #5, !dbg !59
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14_good(), !dbg !61
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14_bad(), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !67 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @globalFive, align 4, !dbg !68
  %cmp = icmp ne i32 %0, 5, !dbg !70
  br i1 %cmp, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  br label %if.end, !dbg !74

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !81
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !82
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !85
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !85
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !85
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx3, align 4, !dbg !87
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  call void @printWLine(i32* %arraydecay4), !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !91 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @globalFive, align 4, !dbg !92
  %cmp = icmp eq i32 %0, 5, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !96, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !102
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !103
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !106
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !106
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !106
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx3, align 4, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  call void @printWLine(i32* %arraydecay4), !dbg !110
  br label %if.end, !dbg !111

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14_bad", scope: !12, file: !12, line: 22, type: !13, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocation(line: 24, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !11, file: !12, line: 24, column: 8)
!17 = !DILocation(line: 24, column: 18, scope: !16)
!18 = !DILocation(line: 24, column: 8, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 27, type: !22)
!20 = distinct !DILexicalBlock(scope: !21, file: !12, line: 26, column: 9)
!21 = distinct !DILexicalBlock(scope: !16, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 4800, elements: !26)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !24, line: 74, baseType: !25)
!24 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !{!27}
!27 = !DISubrange(count: 150)
!28 = !DILocation(line: 27, column: 21, scope: !20)
!29 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 32, scope: !20)
!34 = !DILocation(line: 29, column: 21, scope: !20)
!35 = !DILocation(line: 29, column: 13, scope: !20)
!36 = !DILocation(line: 30, column: 13, scope: !20)
!37 = !DILocation(line: 30, column: 23, scope: !20)
!38 = !DILocation(line: 31, column: 13, scope: !20)
!39 = !DILocation(line: 33, column: 24, scope: !20)
!40 = !DILocation(line: 33, column: 13, scope: !20)
!41 = !DILocation(line: 35, column: 5, scope: !21)
!42 = !DILocation(line: 36, column: 1, scope: !11)
!43 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_14_good", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocation(line: 83, column: 5, scope: !43)
!45 = !DILocation(line: 84, column: 5, scope: !43)
!46 = !DILocation(line: 85, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 96, type: !48, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{!25, !25, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !12, line: 96, type: !25)
!54 = !DILocation(line: 96, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !12, line: 96, type: !50)
!56 = !DILocation(line: 96, column: 27, scope: !47)
!57 = !DILocation(line: 99, column: 22, scope: !47)
!58 = !DILocation(line: 99, column: 12, scope: !47)
!59 = !DILocation(line: 99, column: 5, scope: !47)
!60 = !DILocation(line: 101, column: 5, scope: !47)
!61 = !DILocation(line: 102, column: 5, scope: !47)
!62 = !DILocation(line: 103, column: 5, scope: !47)
!63 = !DILocation(line: 106, column: 5, scope: !47)
!64 = !DILocation(line: 107, column: 5, scope: !47)
!65 = !DILocation(line: 108, column: 5, scope: !47)
!66 = !DILocation(line: 110, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 43, type: !13, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 45, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !67, file: !12, line: 45, column: 8)
!70 = !DILocation(line: 45, column: 18, scope: !69)
!71 = !DILocation(line: 45, column: 8, scope: !67)
!72 = !DILocation(line: 48, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !12, line: 46, column: 5)
!74 = !DILocation(line: 49, column: 5, scope: !73)
!75 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 53, type: !22)
!76 = distinct !DILexicalBlock(scope: !77, file: !12, line: 52, column: 9)
!77 = distinct !DILexicalBlock(scope: !69, file: !12, line: 51, column: 5)
!78 = !DILocation(line: 53, column: 21, scope: !76)
!79 = !DILocalVariable(name: "dest", scope: !76, file: !12, line: 53, type: !30)
!80 = !DILocation(line: 53, column: 32, scope: !76)
!81 = !DILocation(line: 55, column: 21, scope: !76)
!82 = !DILocation(line: 55, column: 13, scope: !76)
!83 = !DILocation(line: 56, column: 13, scope: !76)
!84 = !DILocation(line: 56, column: 23, scope: !76)
!85 = !DILocation(line: 57, column: 13, scope: !76)
!86 = !DILocation(line: 58, column: 13, scope: !76)
!87 = !DILocation(line: 58, column: 22, scope: !76)
!88 = !DILocation(line: 59, column: 24, scope: !76)
!89 = !DILocation(line: 59, column: 13, scope: !76)
!90 = !DILocation(line: 62, column: 1, scope: !67)
!91 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 67, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !12, line: 67, column: 8)
!94 = !DILocation(line: 67, column: 18, scope: !93)
!95 = !DILocation(line: 67, column: 8, scope: !91)
!96 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 70, type: !22)
!97 = distinct !DILexicalBlock(scope: !98, file: !12, line: 69, column: 9)
!98 = distinct !DILexicalBlock(scope: !93, file: !12, line: 68, column: 5)
!99 = !DILocation(line: 70, column: 21, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !97, file: !12, line: 70, type: !30)
!101 = !DILocation(line: 70, column: 32, scope: !97)
!102 = !DILocation(line: 72, column: 21, scope: !97)
!103 = !DILocation(line: 72, column: 13, scope: !97)
!104 = !DILocation(line: 73, column: 13, scope: !97)
!105 = !DILocation(line: 73, column: 23, scope: !97)
!106 = !DILocation(line: 74, column: 13, scope: !97)
!107 = !DILocation(line: 75, column: 13, scope: !97)
!108 = !DILocation(line: 75, column: 22, scope: !97)
!109 = !DILocation(line: 76, column: 24, scope: !97)
!110 = !DILocation(line: 76, column: 13, scope: !97)
!111 = !DILocation(line: 78, column: 5, scope: !98)
!112 = !DILocation(line: 79, column: 1, scope: !91)
