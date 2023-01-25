; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %while.end, !dbg !33

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !45
  %3 = load i8*, i8** %data, align 8, !dbg !46
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !46
  store i8 0, i8* %arrayidx4, align 1, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %4), !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %5) #6, !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #6, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #6, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  br label %while.body, !dbg !79

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !80
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  br label %while.end, !dbg !91

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !95
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx1, align 1, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  %call3 = call i8* @strncpy(i8* %2, i8* %arraydecay2, i64 99) #6, !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx4 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !101
  store i8 0, i8* %arrayidx4, align 1, !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %4), !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !105
  call void @free(i8* %5) #6, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocation(line: 30, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 14, scope: !23)
!25 = !DILocation(line: 31, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 13)
!27 = !DILocation(line: 31, column: 18, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !23)
!29 = !DILocation(line: 31, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 27)
!31 = !DILocation(line: 32, column: 9, scope: !23)
!32 = !DILocation(line: 32, column: 17, scope: !23)
!33 = !DILocation(line: 33, column: 9, scope: !23)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 36, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 36, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 38, column: 9, scope: !35)
!42 = !DILocation(line: 38, column: 23, scope: !35)
!43 = !DILocation(line: 40, column: 17, scope: !35)
!44 = !DILocation(line: 40, column: 23, scope: !35)
!45 = !DILocation(line: 40, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 9, scope: !35)
!47 = !DILocation(line: 41, column: 21, scope: !35)
!48 = !DILocation(line: 42, column: 19, scope: !35)
!49 = !DILocation(line: 42, column: 9, scope: !35)
!50 = !DILocation(line: 43, column: 14, scope: !35)
!51 = !DILocation(line: 43, column: 9, scope: !35)
!52 = !DILocation(line: 45, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_16_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 78, column: 5, scope: !53)
!55 = !DILocation(line: 79, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !57, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 91, type: !59)
!62 = !DILocation(line: 91, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 91, type: !60)
!64 = !DILocation(line: 91, column: 27, scope: !56)
!65 = !DILocation(line: 94, column: 22, scope: !56)
!66 = !DILocation(line: 94, column: 12, scope: !56)
!67 = !DILocation(line: 94, column: 5, scope: !56)
!68 = !DILocation(line: 96, column: 5, scope: !56)
!69 = !DILocation(line: 97, column: 5, scope: !56)
!70 = !DILocation(line: 98, column: 5, scope: !56)
!71 = !DILocation(line: 101, column: 5, scope: !56)
!72 = !DILocation(line: 102, column: 5, scope: !56)
!73 = !DILocation(line: 103, column: 5, scope: !56)
!74 = !DILocation(line: 105, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 54, type: !4)
!77 = !DILocation(line: 54, column: 12, scope: !75)
!78 = !DILocation(line: 55, column: 10, scope: !75)
!79 = !DILocation(line: 56, column: 5, scope: !75)
!80 = !DILocation(line: 59, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 57, column: 5)
!82 = !DILocation(line: 59, column: 14, scope: !81)
!83 = !DILocation(line: 60, column: 13, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !15, line: 60, column: 13)
!85 = !DILocation(line: 60, column: 18, scope: !84)
!86 = !DILocation(line: 60, column: 13, scope: !81)
!87 = !DILocation(line: 60, column: 28, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 60, column: 27)
!89 = !DILocation(line: 61, column: 9, scope: !81)
!90 = !DILocation(line: 61, column: 17, scope: !81)
!91 = !DILocation(line: 62, column: 9, scope: !81)
!92 = !DILocalVariable(name: "source", scope: !93, file: !15, line: 65, type: !36)
!93 = distinct !DILexicalBlock(scope: !75, file: !15, line: 64, column: 5)
!94 = !DILocation(line: 65, column: 14, scope: !93)
!95 = !DILocation(line: 66, column: 9, scope: !93)
!96 = !DILocation(line: 67, column: 9, scope: !93)
!97 = !DILocation(line: 67, column: 23, scope: !93)
!98 = !DILocation(line: 69, column: 17, scope: !93)
!99 = !DILocation(line: 69, column: 23, scope: !93)
!100 = !DILocation(line: 69, column: 9, scope: !93)
!101 = !DILocation(line: 70, column: 9, scope: !93)
!102 = !DILocation(line: 70, column: 21, scope: !93)
!103 = !DILocation(line: 71, column: 19, scope: !93)
!104 = !DILocation(line: 71, column: 9, scope: !93)
!105 = !DILocation(line: 72, column: 14, scope: !93)
!106 = !DILocation(line: 72, column: 9, scope: !93)
!107 = !DILocation(line: 74, column: 1, scope: !75)
