; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17_bad() #0 !dbg !18 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store i64* null, i64** %data, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !28
  br label %for.cond, !dbg !30

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !31
  %cmp = icmp slt i32 %0, 1, !dbg !33
  br i1 %cmp, label %for.body, label %for.end, !dbg !34

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !35
  %1 = bitcast i8* %call to i64*, !dbg !37
  store i64* %1, i64** %data, align 8, !dbg !38
  %2 = load i64*, i64** %data, align 8, !dbg !39
  %cmp1 = icmp eq i64* %2, null, !dbg !41
  br i1 %cmp1, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %3, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !56
  %5 = load i64*, i64** %data, align 8, !dbg !57
  %6 = bitcast i64* %5 to i8*, !dbg !58
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !58
  %7 = bitcast i64* %arraydecay to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !58
  %8 = load i64*, i64** %data, align 8, !dbg !59
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !59
  %9 = load i64, i64* %arrayidx, align 8, !dbg !59
  call void @printLongLongLine(i64 %9), !dbg !60
  %10 = load i64*, i64** %data, align 8, !dbg !61
  %11 = bitcast i64* %10 to i8*, !dbg !61
  call void @free(i8* %11) #7, !dbg !62
  ret void, !dbg !63
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #7, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #7, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i64* null, i64** %data, align 8, !dbg !92
  store i32 0, i32* %h, align 4, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !96
  %cmp = icmp slt i32 %0, 1, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !100
  %1 = bitcast i8* %call to i64*, !dbg !102
  store i64* %1, i64** %data, align 8, !dbg !103
  %2 = load i64*, i64** %data, align 8, !dbg !104
  %cmp1 = icmp eq i64* %2, null, !dbg !106
  br i1 %cmp1, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !110

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %h, align 4, !dbg !111
  %inc = add nsw i32 %3, 1, !dbg !111
  store i32 %inc, i32* %h, align 4, !dbg !111
  br label %for.cond, !dbg !112, !llvm.loop !113

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %4 = bitcast [100 x i64]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 800, i1 false), !dbg !117
  %5 = load i64*, i64** %data, align 8, !dbg !118
  %6 = bitcast i64* %5 to i8*, !dbg !119
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !119
  %7 = bitcast i64* %arraydecay to i8*, !dbg !119
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 16 %7, i64 800, i1 false), !dbg !119
  %8 = load i64*, i64** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !120
  %9 = load i64, i64* %arrayidx, align 8, !dbg !120
  call void @printLongLongLine(i64 %9), !dbg !121
  %10 = load i64*, i64** %data, align 8, !dbg !122
  %11 = bitcast i64* %10 to i8*, !dbg !122
  call void @free(i8* %11) #7, !dbg !123
  ret void, !dbg !124
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "i", scope: !18, file: !19, line: 23, type: !23)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DILocation(line: 23, column: 9, scope: !18)
!25 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 15, scope: !18)
!27 = !DILocation(line: 25, column: 10, scope: !18)
!28 = !DILocation(line: 26, column: 11, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 26, column: 5)
!30 = !DILocation(line: 26, column: 9, scope: !29)
!31 = !DILocation(line: 26, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !19, line: 26, column: 5)
!33 = !DILocation(line: 26, column: 18, scope: !32)
!34 = !DILocation(line: 26, column: 5, scope: !29)
!35 = !DILocation(line: 29, column: 27, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 27, column: 5)
!37 = !DILocation(line: 29, column: 16, scope: !36)
!38 = !DILocation(line: 29, column: 14, scope: !36)
!39 = !DILocation(line: 30, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !19, line: 30, column: 13)
!41 = !DILocation(line: 30, column: 18, scope: !40)
!42 = !DILocation(line: 30, column: 13, scope: !36)
!43 = !DILocation(line: 30, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 30, column: 27)
!45 = !DILocation(line: 31, column: 5, scope: !36)
!46 = !DILocation(line: 26, column: 24, scope: !32)
!47 = !DILocation(line: 26, column: 5, scope: !32)
!48 = distinct !{!48, !34, !49, !50}
!49 = !DILocation(line: 31, column: 5, scope: !29)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !19, line: 33, type: !53)
!52 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 33, column: 17, scope: !52)
!57 = !DILocation(line: 35, column: 16, scope: !52)
!58 = !DILocation(line: 35, column: 9, scope: !52)
!59 = !DILocation(line: 36, column: 27, scope: !52)
!60 = !DILocation(line: 36, column: 9, scope: !52)
!61 = !DILocation(line: 37, column: 14, scope: !52)
!62 = !DILocation(line: 37, column: 9, scope: !52)
!63 = !DILocation(line: 39, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_17_good", scope: !19, file: !19, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 68, column: 5, scope: !64)
!66 = !DILocation(line: 69, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 81, type: !68, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!23, !23, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !19, line: 81, type: !23)
!74 = !DILocation(line: 81, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !19, line: 81, type: !70)
!76 = !DILocation(line: 81, column: 27, scope: !67)
!77 = !DILocation(line: 84, column: 22, scope: !67)
!78 = !DILocation(line: 84, column: 12, scope: !67)
!79 = !DILocation(line: 84, column: 5, scope: !67)
!80 = !DILocation(line: 86, column: 5, scope: !67)
!81 = !DILocation(line: 87, column: 5, scope: !67)
!82 = !DILocation(line: 88, column: 5, scope: !67)
!83 = !DILocation(line: 91, column: 5, scope: !67)
!84 = !DILocation(line: 92, column: 5, scope: !67)
!85 = !DILocation(line: 93, column: 5, scope: !67)
!86 = !DILocation(line: 95, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 46, type: !20, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "h", scope: !87, file: !19, line: 48, type: !23)
!89 = !DILocation(line: 48, column: 9, scope: !87)
!90 = !DILocalVariable(name: "data", scope: !87, file: !19, line: 49, type: !4)
!91 = !DILocation(line: 49, column: 15, scope: !87)
!92 = !DILocation(line: 50, column: 10, scope: !87)
!93 = !DILocation(line: 51, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !19, line: 51, column: 5)
!95 = !DILocation(line: 51, column: 9, scope: !94)
!96 = !DILocation(line: 51, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !19, line: 51, column: 5)
!98 = !DILocation(line: 51, column: 18, scope: !97)
!99 = !DILocation(line: 51, column: 5, scope: !94)
!100 = !DILocation(line: 54, column: 27, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !19, line: 52, column: 5)
!102 = !DILocation(line: 54, column: 16, scope: !101)
!103 = !DILocation(line: 54, column: 14, scope: !101)
!104 = !DILocation(line: 55, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !19, line: 55, column: 13)
!106 = !DILocation(line: 55, column: 18, scope: !105)
!107 = !DILocation(line: 55, column: 13, scope: !101)
!108 = !DILocation(line: 55, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !19, line: 55, column: 27)
!110 = !DILocation(line: 56, column: 5, scope: !101)
!111 = !DILocation(line: 51, column: 24, scope: !97)
!112 = !DILocation(line: 51, column: 5, scope: !97)
!113 = distinct !{!113, !99, !114, !50}
!114 = !DILocation(line: 56, column: 5, scope: !94)
!115 = !DILocalVariable(name: "source", scope: !116, file: !19, line: 58, type: !53)
!116 = distinct !DILexicalBlock(scope: !87, file: !19, line: 57, column: 5)
!117 = !DILocation(line: 58, column: 17, scope: !116)
!118 = !DILocation(line: 60, column: 16, scope: !116)
!119 = !DILocation(line: 60, column: 9, scope: !116)
!120 = !DILocation(line: 61, column: 27, scope: !116)
!121 = !DILocation(line: 61, column: 9, scope: !116)
!122 = !DILocation(line: 62, column: 14, scope: !116)
!123 = !DILocation(line: 62, column: 9, scope: !116)
!124 = !DILocation(line: 64, column: 1, scope: !87)
