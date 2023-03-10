; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_44.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !29
  store i8* %call, i8** %dataBuffer, align 8, !dbg !28
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !37
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !41
  store i8* %add.ptr, i8** %data, align 8, !dbg !42
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  call void %4(i8* %5), !dbg !43
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx, align 1, !dbg !57
  %0 = load i8*, i8** %data.addr, align 8, !dbg !58
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !60
  %1 = load i8*, i8** %data.addr, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !61
  store i8 0, i8* %arrayidx2, align 1, !dbg !62
  %2 = load i8*, i8** %data.addr, align 8, !dbg !63
  call void @printLine(i8* %2), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_ncpy_44_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_44_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE124_Buffer_Underwrite__malloc_char_ncpy_44_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !91, metadata !DIExpression()), !dbg !92
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !92
  store i8* null, i8** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !94, metadata !DIExpression()), !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !97
  store i8* %call, i8** %dataBuffer, align 8, !dbg !96
  %0 = load i8*, i8** %dataBuffer, align 8, !dbg !98
  %cmp = icmp eq i8* %0, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !105
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !108
  store i8* %3, i8** %data, align 8, !dbg !109
  %4 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !110
  %5 = load i8*, i8** %data, align 8, !dbg !111
  call void %4(i8* %5), !dbg !110
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !113 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx, align 1, !dbg !121
  %0 = load i8*, i8** %data.addr, align 8, !dbg !122
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  %call = call i8* @strncpy(i8* %0, i8* %arraydecay1, i64 99) #6, !dbg !124
  %1 = load i8*, i8** %data.addr, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i8, i8* %1, i64 99, !dbg !125
  store i8 0, i8* %arrayidx2, align 1, !dbg !126
  %2 = load i8*, i8** %data.addr, align 8, !dbg !127
  call void @printLine(i8* %2), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_44_bad", scope: !15, file: !15, line: 39, type: !16, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_ncpy_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 41, type: !4)
!19 = !DILocation(line: 41, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 43, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 43, column: 12, scope: !14)
!25 = !DILocation(line: 44, column: 10, scope: !14)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !15, line: 46, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!28 = !DILocation(line: 46, column: 16, scope: !27)
!29 = !DILocation(line: 46, column: 37, scope: !27)
!30 = !DILocation(line: 47, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 47, column: 13)
!32 = !DILocation(line: 47, column: 24, scope: !31)
!33 = !DILocation(line: 47, column: 13, scope: !27)
!34 = !DILocation(line: 47, column: 34, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 47, column: 33)
!36 = !DILocation(line: 48, column: 16, scope: !27)
!37 = !DILocation(line: 48, column: 9, scope: !27)
!38 = !DILocation(line: 49, column: 9, scope: !27)
!39 = !DILocation(line: 49, column: 27, scope: !27)
!40 = !DILocation(line: 51, column: 16, scope: !27)
!41 = !DILocation(line: 51, column: 27, scope: !27)
!42 = !DILocation(line: 51, column: 14, scope: !27)
!43 = !DILocation(line: 54, column: 5, scope: !14)
!44 = !DILocation(line: 54, column: 13, scope: !14)
!45 = !DILocation(line: 55, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !15, line: 23, type: !4)
!48 = !DILocation(line: 23, column: 28, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !15, line: 26, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 25, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 26, column: 14, scope: !50)
!55 = !DILocation(line: 27, column: 9, scope: !50)
!56 = !DILocation(line: 28, column: 9, scope: !50)
!57 = !DILocation(line: 28, column: 23, scope: !50)
!58 = !DILocation(line: 30, column: 17, scope: !50)
!59 = !DILocation(line: 30, column: 23, scope: !50)
!60 = !DILocation(line: 30, column: 9, scope: !50)
!61 = !DILocation(line: 32, column: 9, scope: !50)
!62 = !DILocation(line: 32, column: 21, scope: !50)
!63 = !DILocation(line: 33, column: 19, scope: !50)
!64 = !DILocation(line: 33, column: 9, scope: !50)
!65 = !DILocation(line: 37, column: 1, scope: !46)
!66 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_ncpy_44_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 96, column: 5, scope: !66)
!68 = !DILocation(line: 97, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 108, type: !70, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!72, !72, !73}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !15, line: 108, type: !72)
!75 = !DILocation(line: 108, column: 14, scope: !69)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !15, line: 108, type: !73)
!77 = !DILocation(line: 108, column: 27, scope: !69)
!78 = !DILocation(line: 111, column: 22, scope: !69)
!79 = !DILocation(line: 111, column: 12, scope: !69)
!80 = !DILocation(line: 111, column: 5, scope: !69)
!81 = !DILocation(line: 113, column: 5, scope: !69)
!82 = !DILocation(line: 114, column: 5, scope: !69)
!83 = !DILocation(line: 115, column: 5, scope: !69)
!84 = !DILocation(line: 118, column: 5, scope: !69)
!85 = !DILocation(line: 119, column: 5, scope: !69)
!86 = !DILocation(line: 120, column: 5, scope: !69)
!87 = !DILocation(line: 122, column: 5, scope: !69)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 80, type: !4)
!90 = !DILocation(line: 80, column: 12, scope: !88)
!91 = !DILocalVariable(name: "funcPtr", scope: !88, file: !15, line: 81, type: !21)
!92 = !DILocation(line: 81, column: 12, scope: !88)
!93 = !DILocation(line: 82, column: 10, scope: !88)
!94 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !15, line: 84, type: !4)
!95 = distinct !DILexicalBlock(scope: !88, file: !15, line: 83, column: 5)
!96 = !DILocation(line: 84, column: 16, scope: !95)
!97 = !DILocation(line: 84, column: 37, scope: !95)
!98 = !DILocation(line: 85, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 85, column: 13)
!100 = !DILocation(line: 85, column: 24, scope: !99)
!101 = !DILocation(line: 85, column: 13, scope: !95)
!102 = !DILocation(line: 85, column: 34, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 85, column: 33)
!104 = !DILocation(line: 86, column: 16, scope: !95)
!105 = !DILocation(line: 86, column: 9, scope: !95)
!106 = !DILocation(line: 87, column: 9, scope: !95)
!107 = !DILocation(line: 87, column: 27, scope: !95)
!108 = !DILocation(line: 89, column: 16, scope: !95)
!109 = !DILocation(line: 89, column: 14, scope: !95)
!110 = !DILocation(line: 91, column: 5, scope: !88)
!111 = !DILocation(line: 91, column: 13, scope: !88)
!112 = !DILocation(line: 92, column: 1, scope: !88)
!113 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 62, type: !22, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", arg: 1, scope: !113, file: !15, line: 62, type: !4)
!115 = !DILocation(line: 62, column: 32, scope: !113)
!116 = !DILocalVariable(name: "source", scope: !117, file: !15, line: 65, type: !51)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 64, column: 5)
!118 = !DILocation(line: 65, column: 14, scope: !117)
!119 = !DILocation(line: 66, column: 9, scope: !117)
!120 = !DILocation(line: 67, column: 9, scope: !117)
!121 = !DILocation(line: 67, column: 23, scope: !117)
!122 = !DILocation(line: 69, column: 17, scope: !117)
!123 = !DILocation(line: 69, column: 23, scope: !117)
!124 = !DILocation(line: 69, column: 9, scope: !117)
!125 = !DILocation(line: 71, column: 9, scope: !117)
!126 = !DILocation(line: 71, column: 21, scope: !117)
!127 = !DILocation(line: 72, column: 19, scope: !117)
!128 = !DILocation(line: 72, column: 9, scope: !117)
!129 = !DILocation(line: 76, column: 1, scope: !113)
