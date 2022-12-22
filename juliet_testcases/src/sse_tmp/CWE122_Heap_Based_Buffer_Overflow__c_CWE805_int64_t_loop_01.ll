; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !25
  %0 = bitcast i8* %call to i64*, !dbg !26
  store i64* %0, i64** %data, align 8, !dbg !27
  %1 = load i64*, i64** %data, align 8, !dbg !28
  %cmp = icmp eq i64* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !49
  %cmp1 = icmp ult i64 %3, 100, !dbg !51
  br i1 %cmp1, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !55
  %5 = load i64, i64* %arrayidx, align 8, !dbg !55
  %6 = load i64*, i64** %data, align 8, !dbg !56
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !56
  store i64 %5, i64* %arrayidx2, align 8, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %8, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !65
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !65
  call void @printLongLongLine(i64 %10), !dbg !66
  %11 = load i64*, i64** %data, align 8, !dbg !67
  %12 = bitcast i64* %11 to i8*, !dbg !67
  call void @free(i8* %12) #6, !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLongLongLine(i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #6, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #6, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !94 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i64* null, i64** %data, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !98
  %0 = bitcast i8* %call to i64*, !dbg !99
  store i64* %0, i64** %data, align 8, !dbg !100
  %1 = load i64*, i64** %data, align 8, !dbg !101
  %cmp = icmp eq i64* %1, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !116
  %cmp1 = icmp ult i64 %3, 100, !dbg !118
  br i1 %cmp1, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !122
  %5 = load i64, i64* %arrayidx, align 8, !dbg !122
  %6 = load i64*, i64** %data, align 8, !dbg !123
  %7 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !123
  store i64 %5, i64* %arrayidx2, align 8, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %8, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !131
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !131
  call void @printLongLongLine(i64 %10), !dbg !132
  %11 = load i64*, i64** %data, align 8, !dbg !133
  %12 = bitcast i64* %11 to i8*, !dbg !133
  call void @free(i8* %12) #6, !dbg !134
  ret void, !dbg !135
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
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 43, baseType: !9)
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 26, column: 23, scope: !18)
!26 = !DILocation(line: 26, column: 12, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 9, scope: !18)
!32 = !DILocation(line: 27, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 23)
!34 = !DILocalVariable(name: "source", scope: !35, file: !19, line: 29, type: !36)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 29, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !41, file: !19, line: 31, type: !42)
!41 = distinct !DILexicalBlock(scope: !35, file: !19, line: 30, column: 9)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 46, baseType: !44)
!43 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!44 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 31, column: 20, scope: !41)
!46 = !DILocation(line: 33, column: 20, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !19, line: 33, column: 13)
!48 = !DILocation(line: 33, column: 18, scope: !47)
!49 = !DILocation(line: 33, column: 25, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !19, line: 33, column: 13)
!51 = !DILocation(line: 33, column: 27, scope: !50)
!52 = !DILocation(line: 33, column: 13, scope: !47)
!53 = !DILocation(line: 35, column: 34, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !19, line: 34, column: 13)
!55 = !DILocation(line: 35, column: 27, scope: !54)
!56 = !DILocation(line: 35, column: 17, scope: !54)
!57 = !DILocation(line: 35, column: 22, scope: !54)
!58 = !DILocation(line: 35, column: 25, scope: !54)
!59 = !DILocation(line: 36, column: 13, scope: !54)
!60 = !DILocation(line: 33, column: 35, scope: !50)
!61 = !DILocation(line: 33, column: 13, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 36, column: 13, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 37, column: 31, scope: !41)
!66 = !DILocation(line: 37, column: 13, scope: !41)
!67 = !DILocation(line: 38, column: 18, scope: !41)
!68 = !DILocation(line: 38, column: 13, scope: !41)
!69 = !DILocation(line: 41, column: 1, scope: !18)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_01_good", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 72, column: 5, scope: !70)
!72 = !DILocation(line: 73, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 85, type: !74, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !19, line: 85, type: !76)
!81 = !DILocation(line: 85, column: 14, scope: !73)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !19, line: 85, type: !77)
!83 = !DILocation(line: 85, column: 27, scope: !73)
!84 = !DILocation(line: 88, column: 22, scope: !73)
!85 = !DILocation(line: 88, column: 12, scope: !73)
!86 = !DILocation(line: 88, column: 5, scope: !73)
!87 = !DILocation(line: 90, column: 5, scope: !73)
!88 = !DILocation(line: 91, column: 5, scope: !73)
!89 = !DILocation(line: 92, column: 5, scope: !73)
!90 = !DILocation(line: 95, column: 5, scope: !73)
!91 = !DILocation(line: 96, column: 5, scope: !73)
!92 = !DILocation(line: 97, column: 5, scope: !73)
!93 = !DILocation(line: 99, column: 5, scope: !73)
!94 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 48, type: !20, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !19, line: 50, type: !4)
!96 = !DILocation(line: 50, column: 15, scope: !94)
!97 = !DILocation(line: 51, column: 10, scope: !94)
!98 = !DILocation(line: 53, column: 23, scope: !94)
!99 = !DILocation(line: 53, column: 12, scope: !94)
!100 = !DILocation(line: 53, column: 10, scope: !94)
!101 = !DILocation(line: 54, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !19, line: 54, column: 9)
!103 = !DILocation(line: 54, column: 14, scope: !102)
!104 = !DILocation(line: 54, column: 9, scope: !94)
!105 = !DILocation(line: 54, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !19, line: 54, column: 23)
!107 = !DILocalVariable(name: "source", scope: !108, file: !19, line: 56, type: !36)
!108 = distinct !DILexicalBlock(scope: !94, file: !19, line: 55, column: 5)
!109 = !DILocation(line: 56, column: 17, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !111, file: !19, line: 58, type: !42)
!111 = distinct !DILexicalBlock(scope: !108, file: !19, line: 57, column: 9)
!112 = !DILocation(line: 58, column: 20, scope: !111)
!113 = !DILocation(line: 60, column: 20, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !19, line: 60, column: 13)
!115 = !DILocation(line: 60, column: 18, scope: !114)
!116 = !DILocation(line: 60, column: 25, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !19, line: 60, column: 13)
!118 = !DILocation(line: 60, column: 27, scope: !117)
!119 = !DILocation(line: 60, column: 13, scope: !114)
!120 = !DILocation(line: 62, column: 34, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 61, column: 13)
!122 = !DILocation(line: 62, column: 27, scope: !121)
!123 = !DILocation(line: 62, column: 17, scope: !121)
!124 = !DILocation(line: 62, column: 22, scope: !121)
!125 = !DILocation(line: 62, column: 25, scope: !121)
!126 = !DILocation(line: 63, column: 13, scope: !121)
!127 = !DILocation(line: 60, column: 35, scope: !117)
!128 = !DILocation(line: 60, column: 13, scope: !117)
!129 = distinct !{!129, !119, !130, !64}
!130 = !DILocation(line: 63, column: 13, scope: !114)
!131 = !DILocation(line: 64, column: 31, scope: !111)
!132 = !DILocation(line: 64, column: 13, scope: !111)
!133 = !DILocation(line: 65, column: 18, scope: !111)
!134 = !DILocation(line: 65, column: 13, scope: !111)
!135 = !DILocation(line: 68, column: 1, scope: !94)
