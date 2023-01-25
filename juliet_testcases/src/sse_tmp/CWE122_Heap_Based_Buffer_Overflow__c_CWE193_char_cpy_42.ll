; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i8*, i8** %data, align 8, !dbg !21
  %call = call i8* @badSource(i8* %0), !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !31
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  call void @printLine(i8* %3), !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  call void @free(i8* %4) #6, !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !38 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !43
  store i8* %call, i8** %data.addr, align 8, !dbg !44
  %0 = load i8*, i8** %data.addr, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !51
  ret i8* %1, !dbg !52
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_good() #0 !dbg !53 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %0 = load i8*, i8** %data, align 8, !dbg !79
  %call = call i8* @goodG2BSource(i8* %0), !dbg !80
  store i8* %call, i8** %data, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !84
  %2 = load i8*, i8** %data, align 8, !dbg !85
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !86
  %call1 = call i8* @strcpy(i8* %2, i8* %arraydecay) #6, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !88
  call void @printLine(i8* %3), !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  call void @free(i8* %4) #6, !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !93 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !96
  store i8* %call, i8** %data.addr, align 8, !dbg !97
  %0 = load i8*, i8** %data.addr, align 8, !dbg !98
  %cmp = icmp eq i8* %0, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !104
  ret i8* %1, !dbg !105
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !7}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_bad", scope: !15, file: !15, line: 36, type: !16, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 38, type: !5)
!19 = !DILocation(line: 38, column: 12, scope: !14)
!20 = !DILocation(line: 39, column: 10, scope: !14)
!21 = !DILocation(line: 40, column: 22, scope: !14)
!22 = !DILocation(line: 40, column: 12, scope: !14)
!23 = !DILocation(line: 40, column: 10, scope: !14)
!24 = !DILocalVariable(name: "source", scope: !25, file: !15, line: 42, type: !26)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 42, column: 14, scope: !25)
!30 = !DILocation(line: 44, column: 16, scope: !25)
!31 = !DILocation(line: 44, column: 22, scope: !25)
!32 = !DILocation(line: 44, column: 9, scope: !25)
!33 = !DILocation(line: 45, column: 19, scope: !25)
!34 = !DILocation(line: 45, column: 9, scope: !25)
!35 = !DILocation(line: 46, column: 14, scope: !25)
!36 = !DILocation(line: 46, column: 9, scope: !25)
!37 = !DILocation(line: 48, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 28, type: !39, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DISubroutineType(types: !40)
!40 = !{!5, !5}
!41 = !DILocalVariable(name: "data", arg: 1, scope: !38, file: !15, line: 28, type: !5)
!42 = !DILocation(line: 28, column: 32, scope: !38)
!43 = !DILocation(line: 31, column: 20, scope: !38)
!44 = !DILocation(line: 31, column: 10, scope: !38)
!45 = !DILocation(line: 32, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !15, line: 32, column: 9)
!47 = !DILocation(line: 32, column: 14, scope: !46)
!48 = !DILocation(line: 32, column: 9, scope: !38)
!49 = !DILocation(line: 32, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 32, column: 23)
!51 = !DILocation(line: 33, column: 12, scope: !38)
!52 = !DILocation(line: 33, column: 5, scope: !38)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_42_good", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 79, column: 5, scope: !53)
!55 = !DILocation(line: 80, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !57, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 92, type: !59)
!62 = !DILocation(line: 92, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 92, type: !60)
!64 = !DILocation(line: 92, column: 27, scope: !56)
!65 = !DILocation(line: 95, column: 22, scope: !56)
!66 = !DILocation(line: 95, column: 12, scope: !56)
!67 = !DILocation(line: 95, column: 5, scope: !56)
!68 = !DILocation(line: 97, column: 5, scope: !56)
!69 = !DILocation(line: 98, column: 5, scope: !56)
!70 = !DILocation(line: 99, column: 5, scope: !56)
!71 = !DILocation(line: 102, column: 5, scope: !56)
!72 = !DILocation(line: 103, column: 5, scope: !56)
!73 = !DILocation(line: 104, column: 5, scope: !56)
!74 = !DILocation(line: 106, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !16, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 65, type: !5)
!77 = !DILocation(line: 65, column: 12, scope: !75)
!78 = !DILocation(line: 66, column: 10, scope: !75)
!79 = !DILocation(line: 67, column: 26, scope: !75)
!80 = !DILocation(line: 67, column: 12, scope: !75)
!81 = !DILocation(line: 67, column: 10, scope: !75)
!82 = !DILocalVariable(name: "source", scope: !83, file: !15, line: 69, type: !26)
!83 = distinct !DILexicalBlock(scope: !75, file: !15, line: 68, column: 5)
!84 = !DILocation(line: 69, column: 14, scope: !83)
!85 = !DILocation(line: 71, column: 16, scope: !83)
!86 = !DILocation(line: 71, column: 22, scope: !83)
!87 = !DILocation(line: 71, column: 9, scope: !83)
!88 = !DILocation(line: 72, column: 19, scope: !83)
!89 = !DILocation(line: 72, column: 9, scope: !83)
!90 = !DILocation(line: 73, column: 14, scope: !83)
!91 = !DILocation(line: 73, column: 9, scope: !83)
!92 = !DILocation(line: 75, column: 1, scope: !75)
!93 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 54, type: !39, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !15, line: 54, type: !5)
!95 = !DILocation(line: 54, column: 36, scope: !93)
!96 = !DILocation(line: 57, column: 20, scope: !93)
!97 = !DILocation(line: 57, column: 10, scope: !93)
!98 = !DILocation(line: 58, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !15, line: 58, column: 9)
!100 = !DILocation(line: 58, column: 14, scope: !99)
!101 = !DILocation(line: 58, column: 9, scope: !93)
!102 = !DILocation(line: 58, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 58, column: 23)
!104 = !DILocation(line: 59, column: 12, scope: !93)
!105 = !DILocation(line: 59, column: 5, scope: !93)
