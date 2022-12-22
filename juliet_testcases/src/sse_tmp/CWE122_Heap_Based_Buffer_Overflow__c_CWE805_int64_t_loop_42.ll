; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %0 = load i64*, i64** %data, align 8, !dbg !25
  %call = call i64* @badSource(i64* %0), !dbg !26
  store i64* %call, i64** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !28, metadata !DIExpression()), !dbg !33
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %2, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !49
  %4 = load i64, i64* %arrayidx, align 8, !dbg !49
  %5 = load i64*, i64** %data, align 8, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !50
  store i64 %4, i64* %arrayidx1, align 8, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %7, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !59
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !59
  call void @printLongLongLine(i64 %9), !dbg !60
  %10 = load i64*, i64** %data, align 8, !dbg !61
  %11 = bitcast i64* %10 to i8*, !dbg !61
  call void @free(i8* %11) #6, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i64* @badSource(i64* %data) #0 !dbg !64 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !69
  %0 = bitcast i8* %call to i64*, !dbg !70
  store i64* %0, i64** %data.addr, align 8, !dbg !71
  %1 = load i64*, i64** %data.addr, align 8, !dbg !72
  %cmp = icmp eq i64* %1, null, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !78
  ret i64* %2, !dbg !79
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLongLongLine(i64) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #6, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #6, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i64* null, i64** %data, align 8, !dbg !107
  %0 = load i64*, i64** %data, align 8, !dbg !108
  %call = call i64* @goodG2BSource(i64* %0), !dbg !109
  store i64* %call, i64** %data, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %2, 100, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %3, !dbg !126
  %4 = load i64, i64* %arrayidx, align 8, !dbg !126
  %5 = load i64*, i64** %data, align 8, !dbg !127
  %6 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds i64, i64* %5, i64 %6, !dbg !127
  store i64 %4, i64* %arrayidx1, align 8, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %7, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %8 = load i64*, i64** %data, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 0, !dbg !135
  %9 = load i64, i64* %arrayidx2, align 8, !dbg !135
  call void @printLongLongLine(i64 %9), !dbg !136
  %10 = load i64*, i64** %data, align 8, !dbg !137
  %11 = bitcast i64* %10 to i8*, !dbg !137
  call void @free(i8* %11) #6, !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal i64* @goodG2BSource(i64* %data) #0 !dbg !140 {
entry:
  %data.addr = alloca i64*, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !141, metadata !DIExpression()), !dbg !142
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !143
  %0 = bitcast i8* %call to i64*, !dbg !144
  store i64* %0, i64** %data.addr, align 8, !dbg !145
  %1 = load i64*, i64** %data.addr, align 8, !dbg !146
  %cmp = icmp eq i64* %1, null, !dbg !148
  br i1 %cmp, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !150
  unreachable, !dbg !150

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data.addr, align 8, !dbg !152
  ret i64* %2, !dbg !153
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !11}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 43, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42_bad", scope: !19, file: !19, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42.c", directory: "/root/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 15, scope: !18)
!24 = !DILocation(line: 32, column: 10, scope: !18)
!25 = !DILocation(line: 33, column: 22, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 10, scope: !18)
!28 = !DILocalVariable(name: "source", scope: !29, file: !19, line: 35, type: !30)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 35, column: 17, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !35, file: !19, line: 37, type: !36)
!35 = distinct !DILexicalBlock(scope: !29, file: !19, line: 36, column: 9)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 37, column: 20, scope: !35)
!40 = !DILocation(line: 39, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !19, line: 39, column: 13)
!42 = !DILocation(line: 39, column: 18, scope: !41)
!43 = !DILocation(line: 39, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !19, line: 39, column: 13)
!45 = !DILocation(line: 39, column: 27, scope: !44)
!46 = !DILocation(line: 39, column: 13, scope: !41)
!47 = !DILocation(line: 41, column: 34, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !19, line: 40, column: 13)
!49 = !DILocation(line: 41, column: 27, scope: !48)
!50 = !DILocation(line: 41, column: 17, scope: !48)
!51 = !DILocation(line: 41, column: 22, scope: !48)
!52 = !DILocation(line: 41, column: 25, scope: !48)
!53 = !DILocation(line: 42, column: 13, scope: !48)
!54 = !DILocation(line: 39, column: 35, scope: !44)
!55 = !DILocation(line: 39, column: 13, scope: !44)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 42, column: 13, scope: !41)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 43, column: 31, scope: !35)
!60 = !DILocation(line: 43, column: 13, scope: !35)
!61 = !DILocation(line: 44, column: 18, scope: !35)
!62 = !DILocation(line: 44, column: 13, scope: !35)
!63 = !DILocation(line: 47, column: 1, scope: !18)
!64 = distinct !DISubprogram(name: "badSource", scope: !19, file: !19, line: 21, type: !65, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!5, !5}
!67 = !DILocalVariable(name: "data", arg: 1, scope: !64, file: !19, line: 21, type: !5)
!68 = !DILocation(line: 21, column: 38, scope: !64)
!69 = !DILocation(line: 24, column: 23, scope: !64)
!70 = !DILocation(line: 24, column: 12, scope: !64)
!71 = !DILocation(line: 24, column: 10, scope: !64)
!72 = !DILocation(line: 25, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !64, file: !19, line: 25, column: 9)
!74 = !DILocation(line: 25, column: 14, scope: !73)
!75 = !DILocation(line: 25, column: 9, scope: !64)
!76 = !DILocation(line: 25, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !19, line: 25, column: 23)
!78 = !DILocation(line: 26, column: 12, scope: !64)
!79 = !DILocation(line: 26, column: 5, scope: !64)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_42_good", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocation(line: 84, column: 5, scope: !80)
!82 = !DILocation(line: 85, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 97, type: !84, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !19, line: 97, type: !86)
!91 = !DILocation(line: 97, column: 14, scope: !83)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !19, line: 97, type: !87)
!93 = !DILocation(line: 97, column: 27, scope: !83)
!94 = !DILocation(line: 100, column: 22, scope: !83)
!95 = !DILocation(line: 100, column: 12, scope: !83)
!96 = !DILocation(line: 100, column: 5, scope: !83)
!97 = !DILocation(line: 102, column: 5, scope: !83)
!98 = !DILocation(line: 103, column: 5, scope: !83)
!99 = !DILocation(line: 104, column: 5, scope: !83)
!100 = !DILocation(line: 107, column: 5, scope: !83)
!101 = !DILocation(line: 108, column: 5, scope: !83)
!102 = !DILocation(line: 109, column: 5, scope: !83)
!103 = !DILocation(line: 111, column: 5, scope: !83)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !19, line: 64, type: !5)
!106 = !DILocation(line: 64, column: 15, scope: !104)
!107 = !DILocation(line: 65, column: 10, scope: !104)
!108 = !DILocation(line: 66, column: 26, scope: !104)
!109 = !DILocation(line: 66, column: 12, scope: !104)
!110 = !DILocation(line: 66, column: 10, scope: !104)
!111 = !DILocalVariable(name: "source", scope: !112, file: !19, line: 68, type: !30)
!112 = distinct !DILexicalBlock(scope: !104, file: !19, line: 67, column: 5)
!113 = !DILocation(line: 68, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !19, line: 70, type: !36)
!115 = distinct !DILexicalBlock(scope: !112, file: !19, line: 69, column: 9)
!116 = !DILocation(line: 70, column: 20, scope: !115)
!117 = !DILocation(line: 72, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !19, line: 72, column: 13)
!119 = !DILocation(line: 72, column: 18, scope: !118)
!120 = !DILocation(line: 72, column: 25, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !19, line: 72, column: 13)
!122 = !DILocation(line: 72, column: 27, scope: !121)
!123 = !DILocation(line: 72, column: 13, scope: !118)
!124 = !DILocation(line: 74, column: 34, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !19, line: 73, column: 13)
!126 = !DILocation(line: 74, column: 27, scope: !125)
!127 = !DILocation(line: 74, column: 17, scope: !125)
!128 = !DILocation(line: 74, column: 22, scope: !125)
!129 = !DILocation(line: 74, column: 25, scope: !125)
!130 = !DILocation(line: 75, column: 13, scope: !125)
!131 = !DILocation(line: 72, column: 35, scope: !121)
!132 = !DILocation(line: 72, column: 13, scope: !121)
!133 = distinct !{!133, !123, !134, !58}
!134 = !DILocation(line: 75, column: 13, scope: !118)
!135 = !DILocation(line: 76, column: 31, scope: !115)
!136 = !DILocation(line: 76, column: 13, scope: !115)
!137 = !DILocation(line: 77, column: 18, scope: !115)
!138 = !DILocation(line: 77, column: 13, scope: !115)
!139 = !DILocation(line: 80, column: 1, scope: !104)
!140 = distinct !DISubprogram(name: "goodG2BSource", scope: !19, file: !19, line: 53, type: !65, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", arg: 1, scope: !140, file: !19, line: 53, type: !5)
!142 = !DILocation(line: 53, column: 42, scope: !140)
!143 = !DILocation(line: 56, column: 23, scope: !140)
!144 = !DILocation(line: 56, column: 12, scope: !140)
!145 = !DILocation(line: 56, column: 10, scope: !140)
!146 = !DILocation(line: 57, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !19, line: 57, column: 9)
!148 = !DILocation(line: 57, column: 14, scope: !147)
!149 = !DILocation(line: 57, column: 9, scope: !140)
!150 = !DILocation(line: 57, column: 24, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !19, line: 57, column: 23)
!152 = !DILocation(line: 58, column: 12, scope: !140)
!153 = !DILocation(line: 58, column: 5, scope: !140)
