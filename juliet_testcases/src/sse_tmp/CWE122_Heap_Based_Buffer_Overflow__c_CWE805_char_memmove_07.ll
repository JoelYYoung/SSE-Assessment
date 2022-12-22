; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end3, !dbg !40

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !51
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !51
  %4 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !52
  store i8 0, i8* %arrayidx6, align 1, !dbg !53
  %5 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %5), !dbg !55
  %6 = load i8*, i8** %data, align 8, !dbg !56
  call void @free(i8* %6) #7, !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #7, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #7, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i8* null, i8** %data, align 8, !dbg !84
  %0 = load i32, i32* @staticFive, align 4, !dbg !85
  %cmp = icmp ne i32 %0, 5, !dbg !87
  br i1 %cmp, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end3, !dbg !91

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %cmp1 = icmp eq i8* %1, null, !dbg !97
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !111
  store i8 0, i8* %arrayidx6, align 1, !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %5), !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %6) #7, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i8* null, i8** %data, align 8, !dbg !121
  %0 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp = icmp eq i32 %0, 5, !dbg !124
  br i1 %cmp, label %if.then, label %if.end3, !dbg !125

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !126
  store i8* %call, i8** %data, align 8, !dbg !128
  %1 = load i8*, i8** %data, align 8, !dbg !129
  %cmp1 = icmp eq i8* %1, null, !dbg !131
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !132

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !133
  unreachable, !dbg !133

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  br label %if.end3, !dbg !137

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx4, align 1, !dbg !143
  %3 = load i8*, i8** %data, align 8, !dbg !144
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !145
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay5, i64 100, i1 false), !dbg !145
  %4 = load i8*, i8** %data, align 8, !dbg !146
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !146
  store i8 0, i8* %arrayidx6, align 1, !dbg !147
  %5 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* %5), !dbg !149
  %6 = load i8*, i8** %data, align 8, !dbg !150
  call void @free(i8* %6) #7, !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07.c", directory: "/root/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07_bad", scope: !11, file: !11, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 10, scope: !19)
!25 = !DILocation(line: 33, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!27 = !DILocation(line: 33, column: 18, scope: !26)
!28 = !DILocation(line: 33, column: 8, scope: !19)
!29 = !DILocation(line: 36, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 34, column: 5)
!31 = !DILocation(line: 36, column: 14, scope: !30)
!32 = !DILocation(line: 37, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 37, column: 13)
!34 = !DILocation(line: 37, column: 18, scope: !33)
!35 = !DILocation(line: 37, column: 13, scope: !30)
!36 = !DILocation(line: 37, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 37, column: 27)
!38 = !DILocation(line: 38, column: 9, scope: !30)
!39 = !DILocation(line: 38, column: 17, scope: !30)
!40 = !DILocation(line: 39, column: 5, scope: !30)
!41 = !DILocalVariable(name: "source", scope: !42, file: !11, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !11, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 41, column: 14, scope: !42)
!47 = !DILocation(line: 42, column: 9, scope: !42)
!48 = !DILocation(line: 43, column: 9, scope: !42)
!49 = !DILocation(line: 43, column: 23, scope: !42)
!50 = !DILocation(line: 45, column: 17, scope: !42)
!51 = !DILocation(line: 45, column: 9, scope: !42)
!52 = !DILocation(line: 46, column: 9, scope: !42)
!53 = !DILocation(line: 46, column: 21, scope: !42)
!54 = !DILocation(line: 47, column: 19, scope: !42)
!55 = !DILocation(line: 47, column: 9, scope: !42)
!56 = !DILocation(line: 48, column: 14, scope: !42)
!57 = !DILocation(line: 48, column: 9, scope: !42)
!58 = !DILocation(line: 50, column: 1, scope: !19)
!59 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_07_good", scope: !11, file: !11, line: 109, type: !20, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DILocation(line: 111, column: 5, scope: !59)
!61 = !DILocation(line: 112, column: 5, scope: !59)
!62 = !DILocation(line: 113, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 125, type: !64, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DISubroutineType(types: !65)
!65 = !{!12, !12, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !11, line: 125, type: !12)
!68 = !DILocation(line: 125, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !11, line: 125, type: !66)
!70 = !DILocation(line: 125, column: 27, scope: !63)
!71 = !DILocation(line: 128, column: 22, scope: !63)
!72 = !DILocation(line: 128, column: 12, scope: !63)
!73 = !DILocation(line: 128, column: 5, scope: !63)
!74 = !DILocation(line: 130, column: 5, scope: !63)
!75 = !DILocation(line: 131, column: 5, scope: !63)
!76 = !DILocation(line: 132, column: 5, scope: !63)
!77 = !DILocation(line: 135, column: 5, scope: !63)
!78 = !DILocation(line: 136, column: 5, scope: !63)
!79 = !DILocation(line: 137, column: 5, scope: !63)
!80 = !DILocation(line: 139, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!82 = !DILocalVariable(name: "data", scope: !81, file: !11, line: 59, type: !6)
!83 = !DILocation(line: 59, column: 12, scope: !81)
!84 = !DILocation(line: 60, column: 10, scope: !81)
!85 = !DILocation(line: 61, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !81, file: !11, line: 61, column: 8)
!87 = !DILocation(line: 61, column: 18, scope: !86)
!88 = !DILocation(line: 61, column: 8, scope: !81)
!89 = !DILocation(line: 64, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !11, line: 62, column: 5)
!91 = !DILocation(line: 65, column: 5, scope: !90)
!92 = !DILocation(line: 69, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !11, line: 67, column: 5)
!94 = !DILocation(line: 69, column: 14, scope: !93)
!95 = !DILocation(line: 70, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !11, line: 70, column: 13)
!97 = !DILocation(line: 70, column: 18, scope: !96)
!98 = !DILocation(line: 70, column: 13, scope: !93)
!99 = !DILocation(line: 70, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !11, line: 70, column: 27)
!101 = !DILocation(line: 71, column: 9, scope: !93)
!102 = !DILocation(line: 71, column: 17, scope: !93)
!103 = !DILocalVariable(name: "source", scope: !104, file: !11, line: 74, type: !43)
!104 = distinct !DILexicalBlock(scope: !81, file: !11, line: 73, column: 5)
!105 = !DILocation(line: 74, column: 14, scope: !104)
!106 = !DILocation(line: 75, column: 9, scope: !104)
!107 = !DILocation(line: 76, column: 9, scope: !104)
!108 = !DILocation(line: 76, column: 23, scope: !104)
!109 = !DILocation(line: 78, column: 17, scope: !104)
!110 = !DILocation(line: 78, column: 9, scope: !104)
!111 = !DILocation(line: 79, column: 9, scope: !104)
!112 = !DILocation(line: 79, column: 21, scope: !104)
!113 = !DILocation(line: 80, column: 19, scope: !104)
!114 = !DILocation(line: 80, column: 9, scope: !104)
!115 = !DILocation(line: 81, column: 14, scope: !104)
!116 = !DILocation(line: 81, column: 9, scope: !104)
!117 = !DILocation(line: 83, column: 1, scope: !81)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !11, line: 88, type: !6)
!120 = !DILocation(line: 88, column: 12, scope: !118)
!121 = !DILocation(line: 89, column: 10, scope: !118)
!122 = !DILocation(line: 90, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !11, line: 90, column: 8)
!124 = !DILocation(line: 90, column: 18, scope: !123)
!125 = !DILocation(line: 90, column: 8, scope: !118)
!126 = !DILocation(line: 93, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !11, line: 91, column: 5)
!128 = !DILocation(line: 93, column: 14, scope: !127)
!129 = !DILocation(line: 94, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !11, line: 94, column: 13)
!131 = !DILocation(line: 94, column: 18, scope: !130)
!132 = !DILocation(line: 94, column: 13, scope: !127)
!133 = !DILocation(line: 94, column: 28, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !11, line: 94, column: 27)
!135 = !DILocation(line: 95, column: 9, scope: !127)
!136 = !DILocation(line: 95, column: 17, scope: !127)
!137 = !DILocation(line: 96, column: 5, scope: !127)
!138 = !DILocalVariable(name: "source", scope: !139, file: !11, line: 98, type: !43)
!139 = distinct !DILexicalBlock(scope: !118, file: !11, line: 97, column: 5)
!140 = !DILocation(line: 98, column: 14, scope: !139)
!141 = !DILocation(line: 99, column: 9, scope: !139)
!142 = !DILocation(line: 100, column: 9, scope: !139)
!143 = !DILocation(line: 100, column: 23, scope: !139)
!144 = !DILocation(line: 102, column: 17, scope: !139)
!145 = !DILocation(line: 102, column: 9, scope: !139)
!146 = !DILocation(line: 103, column: 9, scope: !139)
!147 = !DILocation(line: 103, column: 21, scope: !139)
!148 = !DILocation(line: 104, column: 19, scope: !139)
!149 = !DILocation(line: 104, column: 9, scope: !139)
!150 = !DILocation(line: 105, column: 14, scope: !139)
!151 = !DILocation(line: 105, column: 9, scope: !139)
!152 = !DILocation(line: 107, column: 1, scope: !118)
