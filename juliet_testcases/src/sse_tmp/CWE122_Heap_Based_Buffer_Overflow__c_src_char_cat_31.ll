; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %3, i8** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !38
  store i8* %4, i8** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data1, align 8, !dbg !46
  %call2 = call i8* @strcat(i8* %arraydecay, i8* %6) #6, !dbg !47
  %7 = load i8*, i8** %data1, align 8, !dbg !48
  call void @printLine(i8* %7), !dbg !49
  %8 = load i8*, i8** %data1, align 8, !dbg !50
  call void @free(i8* %8) #6, !dbg !51
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
declare dso_local i8* @strcat(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_good() #0 !dbg !53 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_bad(), !dbg !72
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
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !90, metadata !DIExpression()), !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  store i8* %3, i8** %dataCopy, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !94, metadata !DIExpression()), !dbg !95
  %4 = load i8*, i8** %dataCopy, align 8, !dbg !96
  store i8* %4, i8** %data1, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !100
  %6 = load i8*, i8** %data1, align 8, !dbg !101
  %call2 = call i8* @strcat(i8* %arraydecay, i8* %6) #6, !dbg !102
  %7 = load i8*, i8** %data1, align 8, !dbg !103
  call void @printLine(i8* %7), !dbg !104
  %8 = load i8*, i8** %data1, align 8, !dbg !105
  call void @free(i8* %8) #6, !dbg !106
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 29, column: 12, scope: !14)
!29 = !DILocation(line: 29, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !15, line: 32, type: !4)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 16, scope: !33)
!35 = !DILocation(line: 32, column: 27, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 33, type: !4)
!37 = !DILocation(line: 33, column: 16, scope: !33)
!38 = !DILocation(line: 33, column: 23, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 35, column: 18, scope: !40)
!45 = !DILocation(line: 37, column: 20, scope: !40)
!46 = !DILocation(line: 37, column: 26, scope: !40)
!47 = !DILocation(line: 37, column: 13, scope: !40)
!48 = !DILocation(line: 38, column: 23, scope: !40)
!49 = !DILocation(line: 38, column: 13, scope: !40)
!50 = !DILocation(line: 39, column: 18, scope: !40)
!51 = !DILocation(line: 39, column: 13, scope: !40)
!52 = !DILocation(line: 42, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_good", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 72, column: 5, scope: !53)
!55 = !DILocation(line: 73, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 84, type: !57, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 84, type: !59)
!62 = !DILocation(line: 84, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 84, type: !60)
!64 = !DILocation(line: 84, column: 27, scope: !56)
!65 = !DILocation(line: 87, column: 22, scope: !56)
!66 = !DILocation(line: 87, column: 12, scope: !56)
!67 = !DILocation(line: 87, column: 5, scope: !56)
!68 = !DILocation(line: 89, column: 5, scope: !56)
!69 = !DILocation(line: 90, column: 5, scope: !56)
!70 = !DILocation(line: 91, column: 5, scope: !56)
!71 = !DILocation(line: 94, column: 5, scope: !56)
!72 = !DILocation(line: 95, column: 5, scope: !56)
!73 = !DILocation(line: 96, column: 5, scope: !56)
!74 = !DILocation(line: 98, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 51, type: !4)
!77 = !DILocation(line: 51, column: 12, scope: !75)
!78 = !DILocation(line: 52, column: 20, scope: !75)
!79 = !DILocation(line: 52, column: 10, scope: !75)
!80 = !DILocation(line: 53, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 53, column: 9)
!82 = !DILocation(line: 53, column: 14, scope: !81)
!83 = !DILocation(line: 53, column: 9, scope: !75)
!84 = !DILocation(line: 53, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 53, column: 23)
!86 = !DILocation(line: 55, column: 12, scope: !75)
!87 = !DILocation(line: 55, column: 5, scope: !75)
!88 = !DILocation(line: 56, column: 5, scope: !75)
!89 = !DILocation(line: 56, column: 16, scope: !75)
!90 = !DILocalVariable(name: "dataCopy", scope: !91, file: !15, line: 58, type: !4)
!91 = distinct !DILexicalBlock(scope: !75, file: !15, line: 57, column: 5)
!92 = !DILocation(line: 58, column: 16, scope: !91)
!93 = !DILocation(line: 58, column: 27, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !15, line: 59, type: !4)
!95 = !DILocation(line: 59, column: 16, scope: !91)
!96 = !DILocation(line: 59, column: 23, scope: !91)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !15, line: 61, type: !41)
!98 = distinct !DILexicalBlock(scope: !91, file: !15, line: 60, column: 9)
!99 = !DILocation(line: 61, column: 18, scope: !98)
!100 = !DILocation(line: 63, column: 20, scope: !98)
!101 = !DILocation(line: 63, column: 26, scope: !98)
!102 = !DILocation(line: 63, column: 13, scope: !98)
!103 = !DILocation(line: 64, column: 23, scope: !98)
!104 = !DILocation(line: 64, column: 13, scope: !98)
!105 = !DILocation(line: 65, column: 18, scope: !98)
!106 = !DILocation(line: 65, column: 13, scope: !98)
!107 = !DILocation(line: 68, column: 1, scope: !75)
