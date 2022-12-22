; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !24
  store i8* %call1, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then2, label %if.end, !dbg !30

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end3, !dbg !35

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx4, align 1, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  %call6 = call i8* @strncpy(i8* %2, i8* %arraydecay5, i64 99) #6, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !48
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !48
  store i8 0, i8* %arrayidx7, align 1, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %4), !dbg !51
  %5 = load i8*, i8** %data, align 8, !dbg !52
  call void @free(i8* %5) #6, !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #6, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #6, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !78 {
entry:
  ret i32 1, !dbg !81
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %call = call i32 @staticReturnsFalse(), !dbg !86
  %tobool = icmp ne i32 %call, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end3, !dbg !91

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !92
  store i8* %call1, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then2, label %if.end, !dbg !98

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx4, align 1, !dbg !108
  %2 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  %call6 = call i8* @strncpy(i8* %2, i8* %arraydecay5, i64 99) #6, !dbg !111
  %3 = load i8*, i8** %data, align 8, !dbg !112
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !112
  store i8 0, i8* %arrayidx7, align 1, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* %4), !dbg !115
  %5 = load i8*, i8** %data, align 8, !dbg !116
  call void @free(i8* %5) #6, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !119 {
entry:
  ret i32 0, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  store i8* null, i8** %data, align 8, !dbg !124
  %call = call i32 @staticReturnsTrue(), !dbg !125
  %tobool = icmp ne i32 %call, 0, !dbg !125
  br i1 %tobool, label %if.then, label %if.end3, !dbg !127

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !128
  store i8* %call1, i8** %data, align 8, !dbg !130
  %0 = load i8*, i8** %data, align 8, !dbg !131
  %cmp = icmp eq i8* %0, null, !dbg !133
  br i1 %cmp, label %if.then2, label %if.end, !dbg !134

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  br label %if.end3, !dbg !139

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !143
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !144
  store i8 0, i8* %arrayidx4, align 1, !dbg !145
  %2 = load i8*, i8** %data, align 8, !dbg !146
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !147
  %call6 = call i8* @strncpy(i8* %2, i8* %arraydecay5, i64 99) #6, !dbg !148
  %3 = load i8*, i8** %data, align 8, !dbg !149
  %arrayidx7 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !149
  store i8 0, i8* %arrayidx7, align 1, !dbg !150
  %4 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* %4), !dbg !152
  %5 = load i8*, i8** %data, align 8, !dbg !153
  call void @free(i8* %5) #6, !dbg !154
  ret void, !dbg !155
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !4)
!19 = !DILocation(line: 39, column: 12, scope: !14)
!20 = !DILocation(line: 40, column: 10, scope: !14)
!21 = !DILocation(line: 41, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 8)
!23 = !DILocation(line: 41, column: 8, scope: !14)
!24 = !DILocation(line: 44, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 42, column: 5)
!26 = !DILocation(line: 44, column: 14, scope: !25)
!27 = !DILocation(line: 45, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 45, column: 13)
!29 = !DILocation(line: 45, column: 18, scope: !28)
!30 = !DILocation(line: 45, column: 13, scope: !25)
!31 = !DILocation(line: 45, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 45, column: 27)
!33 = !DILocation(line: 46, column: 9, scope: !25)
!34 = !DILocation(line: 46, column: 17, scope: !25)
!35 = !DILocation(line: 47, column: 5, scope: !25)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 49, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 49, column: 14, scope: !37)
!42 = !DILocation(line: 50, column: 9, scope: !37)
!43 = !DILocation(line: 51, column: 9, scope: !37)
!44 = !DILocation(line: 51, column: 23, scope: !37)
!45 = !DILocation(line: 53, column: 17, scope: !37)
!46 = !DILocation(line: 53, column: 23, scope: !37)
!47 = !DILocation(line: 53, column: 9, scope: !37)
!48 = !DILocation(line: 54, column: 9, scope: !37)
!49 = !DILocation(line: 54, column: 21, scope: !37)
!50 = !DILocation(line: 55, column: 19, scope: !37)
!51 = !DILocation(line: 55, column: 9, scope: !37)
!52 = !DILocation(line: 56, column: 14, scope: !37)
!53 = !DILocation(line: 56, column: 9, scope: !37)
!54 = !DILocation(line: 58, column: 1, scope: !14)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_08_good", scope: !15, file: !15, line: 117, type: !16, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DILocation(line: 119, column: 5, scope: !55)
!57 = !DILocation(line: 120, column: 5, scope: !55)
!58 = !DILocation(line: 121, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 133, type: !60, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 133, type: !62)
!65 = !DILocation(line: 133, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 133, type: !63)
!67 = !DILocation(line: 133, column: 27, scope: !59)
!68 = !DILocation(line: 136, column: 22, scope: !59)
!69 = !DILocation(line: 136, column: 12, scope: !59)
!70 = !DILocation(line: 136, column: 5, scope: !59)
!71 = !DILocation(line: 138, column: 5, scope: !59)
!72 = !DILocation(line: 139, column: 5, scope: !59)
!73 = !DILocation(line: 140, column: 5, scope: !59)
!74 = !DILocation(line: 143, column: 5, scope: !59)
!75 = !DILocation(line: 144, column: 5, scope: !59)
!76 = !DILocation(line: 145, column: 5, scope: !59)
!77 = !DILocation(line: 147, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !79, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!62}
!81 = !DILocation(line: 27, column: 5, scope: !78)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 67, type: !4)
!84 = !DILocation(line: 67, column: 12, scope: !82)
!85 = !DILocation(line: 68, column: 10, scope: !82)
!86 = !DILocation(line: 69, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !15, line: 69, column: 8)
!88 = !DILocation(line: 69, column: 8, scope: !82)
!89 = !DILocation(line: 72, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 70, column: 5)
!91 = !DILocation(line: 73, column: 5, scope: !90)
!92 = !DILocation(line: 77, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !15, line: 75, column: 5)
!94 = !DILocation(line: 77, column: 14, scope: !93)
!95 = !DILocation(line: 78, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !15, line: 78, column: 13)
!97 = !DILocation(line: 78, column: 18, scope: !96)
!98 = !DILocation(line: 78, column: 13, scope: !93)
!99 = !DILocation(line: 78, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 78, column: 27)
!101 = !DILocation(line: 79, column: 9, scope: !93)
!102 = !DILocation(line: 79, column: 17, scope: !93)
!103 = !DILocalVariable(name: "source", scope: !104, file: !15, line: 82, type: !38)
!104 = distinct !DILexicalBlock(scope: !82, file: !15, line: 81, column: 5)
!105 = !DILocation(line: 82, column: 14, scope: !104)
!106 = !DILocation(line: 83, column: 9, scope: !104)
!107 = !DILocation(line: 84, column: 9, scope: !104)
!108 = !DILocation(line: 84, column: 23, scope: !104)
!109 = !DILocation(line: 86, column: 17, scope: !104)
!110 = !DILocation(line: 86, column: 23, scope: !104)
!111 = !DILocation(line: 86, column: 9, scope: !104)
!112 = !DILocation(line: 87, column: 9, scope: !104)
!113 = !DILocation(line: 87, column: 21, scope: !104)
!114 = !DILocation(line: 88, column: 19, scope: !104)
!115 = !DILocation(line: 88, column: 9, scope: !104)
!116 = !DILocation(line: 89, column: 14, scope: !104)
!117 = !DILocation(line: 89, column: 9, scope: !104)
!118 = !DILocation(line: 91, column: 1, scope: !82)
!119 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !79, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 32, column: 5, scope: !119)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 96, type: !4)
!123 = !DILocation(line: 96, column: 12, scope: !121)
!124 = !DILocation(line: 97, column: 10, scope: !121)
!125 = !DILocation(line: 98, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !15, line: 98, column: 8)
!127 = !DILocation(line: 98, column: 8, scope: !121)
!128 = !DILocation(line: 101, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !15, line: 99, column: 5)
!130 = !DILocation(line: 101, column: 14, scope: !129)
!131 = !DILocation(line: 102, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !15, line: 102, column: 13)
!133 = !DILocation(line: 102, column: 18, scope: !132)
!134 = !DILocation(line: 102, column: 13, scope: !129)
!135 = !DILocation(line: 102, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !15, line: 102, column: 27)
!137 = !DILocation(line: 103, column: 9, scope: !129)
!138 = !DILocation(line: 103, column: 17, scope: !129)
!139 = !DILocation(line: 104, column: 5, scope: !129)
!140 = !DILocalVariable(name: "source", scope: !141, file: !15, line: 106, type: !38)
!141 = distinct !DILexicalBlock(scope: !121, file: !15, line: 105, column: 5)
!142 = !DILocation(line: 106, column: 14, scope: !141)
!143 = !DILocation(line: 107, column: 9, scope: !141)
!144 = !DILocation(line: 108, column: 9, scope: !141)
!145 = !DILocation(line: 108, column: 23, scope: !141)
!146 = !DILocation(line: 110, column: 17, scope: !141)
!147 = !DILocation(line: 110, column: 23, scope: !141)
!148 = !DILocation(line: 110, column: 9, scope: !141)
!149 = !DILocation(line: 111, column: 9, scope: !141)
!150 = !DILocation(line: 111, column: 21, scope: !141)
!151 = !DILocation(line: 112, column: 19, scope: !141)
!152 = !DILocation(line: 112, column: 9, scope: !141)
!153 = !DILocation(line: 113, column: 14, scope: !141)
!154 = !DILocation(line: 113, column: 9, scope: !141)
!155 = !DILocation(line: 115, column: 1, scope: !121)
