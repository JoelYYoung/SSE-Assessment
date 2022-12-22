; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !24, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !39
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !42
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !42
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !42
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  call void @printWLine(i32* %arraydecay3), !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05_good() #0 !dbg !47 {
entry:
  call void @good1(), !dbg !48
  call void @good2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #5, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #5, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !71 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticFalse, align 4, !dbg !72
  %tobool = icmp ne i32 %0, 0, !dbg !72
  br i1 %tobool, label %if.then, label %if.else, !dbg !74

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  br label %if.end, !dbg !77

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !78, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !82, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !84
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !85
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !88
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !88
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !88
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx3, align 4, !dbg !90
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* %arraydecay4), !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !94 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !95
  %tobool = icmp ne i32 %0, 0, !dbg !95
  br i1 %tobool, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !98, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !103
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !104
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #5, !dbg !105
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !108
  %1 = bitcast i32* %arraydecay1 to i8*, !dbg !108
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !108
  %2 = bitcast i32* %arraydecay2 to i8*, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 %2, i64 396, i1 false), !dbg !108
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx3, align 4, !dbg !110
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  call void @printWLine(i32* %arraydecay4), !dbg !112
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05.c", directory: "/root/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 30, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 8)
!23 = !DILocation(line: 30, column: 8, scope: !18)
!24 = !DILocalVariable(name: "data", scope: !25, file: !10, line: 33, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 32, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 4800, elements: !30)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !29, line: 74, baseType: !11)
!29 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!30 = !{!31}
!31 = !DISubrange(count: 150)
!32 = !DILocation(line: 33, column: 21, scope: !25)
!33 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 33, column: 32, scope: !25)
!38 = !DILocation(line: 35, column: 21, scope: !25)
!39 = !DILocation(line: 35, column: 13, scope: !25)
!40 = !DILocation(line: 36, column: 13, scope: !25)
!41 = !DILocation(line: 36, column: 23, scope: !25)
!42 = !DILocation(line: 37, column: 13, scope: !25)
!43 = !DILocation(line: 39, column: 24, scope: !25)
!44 = !DILocation(line: 39, column: 13, scope: !25)
!45 = !DILocation(line: 41, column: 5, scope: !26)
!46 = !DILocation(line: 42, column: 1, scope: !18)
!47 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_memcpy_05_good", scope: !10, file: !10, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 89, column: 5, scope: !47)
!49 = !DILocation(line: 90, column: 5, scope: !47)
!50 = !DILocation(line: 91, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 102, type: !52, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!52 = !DISubroutineType(types: !53)
!53 = !{!11, !11, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !10, line: 102, type: !11)
!58 = !DILocation(line: 102, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !10, line: 102, type: !54)
!60 = !DILocation(line: 102, column: 27, scope: !51)
!61 = !DILocation(line: 105, column: 22, scope: !51)
!62 = !DILocation(line: 105, column: 12, scope: !51)
!63 = !DILocation(line: 105, column: 5, scope: !51)
!64 = !DILocation(line: 107, column: 5, scope: !51)
!65 = !DILocation(line: 108, column: 5, scope: !51)
!66 = !DILocation(line: 109, column: 5, scope: !51)
!67 = !DILocation(line: 112, column: 5, scope: !51)
!68 = !DILocation(line: 113, column: 5, scope: !51)
!69 = !DILocation(line: 114, column: 5, scope: !51)
!70 = !DILocation(line: 116, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 49, type: !19, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 51, column: 8, scope: !73)
!73 = distinct !DILexicalBlock(scope: !71, file: !10, line: 51, column: 8)
!74 = !DILocation(line: 51, column: 8, scope: !71)
!75 = !DILocation(line: 54, column: 9, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !10, line: 52, column: 5)
!77 = !DILocation(line: 55, column: 5, scope: !76)
!78 = !DILocalVariable(name: "data", scope: !79, file: !10, line: 59, type: !27)
!79 = distinct !DILexicalBlock(scope: !80, file: !10, line: 58, column: 9)
!80 = distinct !DILexicalBlock(scope: !73, file: !10, line: 57, column: 5)
!81 = !DILocation(line: 59, column: 21, scope: !79)
!82 = !DILocalVariable(name: "dest", scope: !79, file: !10, line: 59, type: !34)
!83 = !DILocation(line: 59, column: 32, scope: !79)
!84 = !DILocation(line: 61, column: 21, scope: !79)
!85 = !DILocation(line: 61, column: 13, scope: !79)
!86 = !DILocation(line: 62, column: 13, scope: !79)
!87 = !DILocation(line: 62, column: 23, scope: !79)
!88 = !DILocation(line: 63, column: 13, scope: !79)
!89 = !DILocation(line: 64, column: 13, scope: !79)
!90 = !DILocation(line: 64, column: 22, scope: !79)
!91 = !DILocation(line: 65, column: 24, scope: !79)
!92 = !DILocation(line: 65, column: 13, scope: !79)
!93 = !DILocation(line: 68, column: 1, scope: !71)
!94 = distinct !DISubprogram(name: "good2", scope: !10, file: !10, line: 71, type: !19, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 73, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !10, line: 73, column: 8)
!97 = !DILocation(line: 73, column: 8, scope: !94)
!98 = !DILocalVariable(name: "data", scope: !99, file: !10, line: 76, type: !27)
!99 = distinct !DILexicalBlock(scope: !100, file: !10, line: 75, column: 9)
!100 = distinct !DILexicalBlock(scope: !96, file: !10, line: 74, column: 5)
!101 = !DILocation(line: 76, column: 21, scope: !99)
!102 = !DILocalVariable(name: "dest", scope: !99, file: !10, line: 76, type: !34)
!103 = !DILocation(line: 76, column: 32, scope: !99)
!104 = !DILocation(line: 78, column: 21, scope: !99)
!105 = !DILocation(line: 78, column: 13, scope: !99)
!106 = !DILocation(line: 79, column: 13, scope: !99)
!107 = !DILocation(line: 79, column: 23, scope: !99)
!108 = !DILocation(line: 80, column: 13, scope: !99)
!109 = !DILocation(line: 81, column: 13, scope: !99)
!110 = !DILocation(line: 81, column: 22, scope: !99)
!111 = !DILocation(line: 82, column: 24, scope: !99)
!112 = !DILocation(line: 82, column: 13, scope: !99)
!113 = !DILocation(line: 84, column: 5, scope: !100)
!114 = !DILocation(line: 85, column: 1, scope: !94)
