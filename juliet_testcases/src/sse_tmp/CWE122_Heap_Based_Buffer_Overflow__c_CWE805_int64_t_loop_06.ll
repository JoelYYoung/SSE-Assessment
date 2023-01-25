; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !25
  %0 = bitcast i8* %call to i64*, !dbg !28
  store i64* %0, i64** %data, align 8, !dbg !29
  %1 = load i64*, i64** %data, align 8, !dbg !30
  %cmp = icmp eq i64* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !51
  %cmp1 = icmp ult i64 %3, 100, !dbg !53
  br i1 %cmp1, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !57
  %5 = load i64, i64* %arrayidx, align 8, !dbg !57
  %6 = load i64*, i64** %data, align 8, !dbg !58
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !58
  store i64 %5, i64* %arrayidx2, align 8, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %8, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !67
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !67
  call void @printLongLongLine(i64 %10), !dbg !68
  %11 = load i64*, i64** %data, align 8, !dbg !69
  %12 = bitcast i64* %11 to i8*, !dbg !69
  call void @free(i8* %12) #6, !dbg !70
  ret void, !dbg !71
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #6, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #6, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i64* null, i64** %data, align 8, !dbg !100
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !101
  %0 = bitcast i8* %call to i64*, !dbg !104
  store i64* %0, i64** %data, align 8, !dbg !105
  %1 = load i64*, i64** %data, align 8, !dbg !106
  %cmp = icmp eq i64* %1, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !121
  %cmp1 = icmp ult i64 %3, 100, !dbg !123
  br i1 %cmp1, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !127
  %5 = load i64, i64* %arrayidx, align 8, !dbg !127
  %6 = load i64*, i64** %data, align 8, !dbg !128
  %7 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !128
  store i64 %5, i64* %arrayidx2, align 8, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %8, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !136
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !136
  call void @printLongLongLine(i64 %10), !dbg !137
  %11 = load i64*, i64** %data, align 8, !dbg !138
  %12 = bitcast i64* %11 to i8*, !dbg !138
  call void @free(i8* %12) #6, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i64* null, i64** %data, align 8, !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 800) #6, !dbg !145
  %0 = bitcast i8* %call to i64*, !dbg !148
  store i64* %0, i64** %data, align 8, !dbg !149
  %1 = load i64*, i64** %data, align 8, !dbg !150
  %cmp = icmp eq i64* %1, null, !dbg !152
  br i1 %cmp, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !156, metadata !DIExpression()), !dbg !158
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !165
  %cmp1 = icmp ult i64 %3, 100, !dbg !167
  br i1 %cmp1, label %for.body, label %for.end, !dbg !168

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !171
  %5 = load i64, i64* %arrayidx, align 8, !dbg !171
  %6 = load i64*, i64** %data, align 8, !dbg !172
  %7 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !172
  store i64 %5, i64* %arrayidx2, align 8, !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !176
  %inc = add i64 %8, 1, !dbg !176
  store i64 %inc, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data, align 8, !dbg !180
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !180
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !180
  call void @printLongLongLine(i64 %10), !dbg !181
  %11 = load i64*, i64** %data, align 8, !dbg !182
  %12 = bitcast i64* %11 to i8*, !dbg !182
  call void @free(i8* %12) #6, !dbg !183
  ret void, !dbg !184
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06_bad", scope: !19, file: !19, line: 25, type: !20, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 27, type: !4)
!23 = !DILocation(line: 27, column: 15, scope: !18)
!24 = !DILocation(line: 28, column: 10, scope: !18)
!25 = !DILocation(line: 32, column: 27, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !19, line: 30, column: 5)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 8)
!28 = !DILocation(line: 32, column: 16, scope: !26)
!29 = !DILocation(line: 32, column: 14, scope: !26)
!30 = !DILocation(line: 33, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !19, line: 33, column: 13)
!32 = !DILocation(line: 33, column: 18, scope: !31)
!33 = !DILocation(line: 33, column: 13, scope: !26)
!34 = !DILocation(line: 33, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !19, line: 33, column: 27)
!36 = !DILocalVariable(name: "source", scope: !37, file: !19, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 36, column: 17, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !19, line: 38, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !19, line: 37, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 20, scope: !43)
!48 = !DILocation(line: 40, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !43, file: !19, line: 40, column: 13)
!50 = !DILocation(line: 40, column: 18, scope: !49)
!51 = !DILocation(line: 40, column: 25, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !19, line: 40, column: 13)
!53 = !DILocation(line: 40, column: 27, scope: !52)
!54 = !DILocation(line: 40, column: 13, scope: !49)
!55 = !DILocation(line: 42, column: 34, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !19, line: 41, column: 13)
!57 = !DILocation(line: 42, column: 27, scope: !56)
!58 = !DILocation(line: 42, column: 17, scope: !56)
!59 = !DILocation(line: 42, column: 22, scope: !56)
!60 = !DILocation(line: 42, column: 25, scope: !56)
!61 = !DILocation(line: 43, column: 13, scope: !56)
!62 = !DILocation(line: 40, column: 35, scope: !52)
!63 = !DILocation(line: 40, column: 13, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 43, column: 13, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 44, column: 31, scope: !43)
!68 = !DILocation(line: 44, column: 13, scope: !43)
!69 = !DILocation(line: 45, column: 18, scope: !43)
!70 = !DILocation(line: 45, column: 13, scope: !43)
!71 = !DILocation(line: 48, column: 1, scope: !18)
!72 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_06_good", scope: !19, file: !19, line: 111, type: !20, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 113, column: 5, scope: !72)
!74 = !DILocation(line: 114, column: 5, scope: !72)
!75 = !DILocation(line: 115, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 127, type: !77, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !19, line: 127, type: !79)
!84 = !DILocation(line: 127, column: 14, scope: !76)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !19, line: 127, type: !80)
!86 = !DILocation(line: 127, column: 27, scope: !76)
!87 = !DILocation(line: 130, column: 22, scope: !76)
!88 = !DILocation(line: 130, column: 12, scope: !76)
!89 = !DILocation(line: 130, column: 5, scope: !76)
!90 = !DILocation(line: 132, column: 5, scope: !76)
!91 = !DILocation(line: 133, column: 5, scope: !76)
!92 = !DILocation(line: 134, column: 5, scope: !76)
!93 = !DILocation(line: 137, column: 5, scope: !76)
!94 = !DILocation(line: 138, column: 5, scope: !76)
!95 = !DILocation(line: 139, column: 5, scope: !76)
!96 = !DILocation(line: 141, column: 5, scope: !76)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 57, type: !4)
!99 = !DILocation(line: 57, column: 15, scope: !97)
!100 = !DILocation(line: 58, column: 10, scope: !97)
!101 = !DILocation(line: 67, column: 27, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !19, line: 65, column: 5)
!103 = distinct !DILexicalBlock(scope: !97, file: !19, line: 59, column: 8)
!104 = !DILocation(line: 67, column: 16, scope: !102)
!105 = !DILocation(line: 67, column: 14, scope: !102)
!106 = !DILocation(line: 68, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !19, line: 68, column: 13)
!108 = !DILocation(line: 68, column: 18, scope: !107)
!109 = !DILocation(line: 68, column: 13, scope: !102)
!110 = !DILocation(line: 68, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 68, column: 27)
!112 = !DILocalVariable(name: "source", scope: !113, file: !19, line: 71, type: !38)
!113 = distinct !DILexicalBlock(scope: !97, file: !19, line: 70, column: 5)
!114 = !DILocation(line: 71, column: 17, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !19, line: 73, type: !44)
!116 = distinct !DILexicalBlock(scope: !113, file: !19, line: 72, column: 9)
!117 = !DILocation(line: 73, column: 20, scope: !116)
!118 = !DILocation(line: 75, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !19, line: 75, column: 13)
!120 = !DILocation(line: 75, column: 18, scope: !119)
!121 = !DILocation(line: 75, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !19, line: 75, column: 13)
!123 = !DILocation(line: 75, column: 27, scope: !122)
!124 = !DILocation(line: 75, column: 13, scope: !119)
!125 = !DILocation(line: 77, column: 34, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !19, line: 76, column: 13)
!127 = !DILocation(line: 77, column: 27, scope: !126)
!128 = !DILocation(line: 77, column: 17, scope: !126)
!129 = !DILocation(line: 77, column: 22, scope: !126)
!130 = !DILocation(line: 77, column: 25, scope: !126)
!131 = !DILocation(line: 78, column: 13, scope: !126)
!132 = !DILocation(line: 75, column: 35, scope: !122)
!133 = !DILocation(line: 75, column: 13, scope: !122)
!134 = distinct !{!134, !124, !135, !66}
!135 = !DILocation(line: 78, column: 13, scope: !119)
!136 = !DILocation(line: 79, column: 31, scope: !116)
!137 = !DILocation(line: 79, column: 13, scope: !116)
!138 = !DILocation(line: 80, column: 18, scope: !116)
!139 = !DILocation(line: 80, column: 13, scope: !116)
!140 = !DILocation(line: 83, column: 1, scope: !97)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !19, line: 88, type: !4)
!143 = !DILocation(line: 88, column: 15, scope: !141)
!144 = !DILocation(line: 89, column: 10, scope: !141)
!145 = !DILocation(line: 93, column: 27, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !19, line: 91, column: 5)
!147 = distinct !DILexicalBlock(scope: !141, file: !19, line: 90, column: 8)
!148 = !DILocation(line: 93, column: 16, scope: !146)
!149 = !DILocation(line: 93, column: 14, scope: !146)
!150 = !DILocation(line: 94, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !19, line: 94, column: 13)
!152 = !DILocation(line: 94, column: 18, scope: !151)
!153 = !DILocation(line: 94, column: 13, scope: !146)
!154 = !DILocation(line: 94, column: 28, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !19, line: 94, column: 27)
!156 = !DILocalVariable(name: "source", scope: !157, file: !19, line: 97, type: !38)
!157 = distinct !DILexicalBlock(scope: !141, file: !19, line: 96, column: 5)
!158 = !DILocation(line: 97, column: 17, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !160, file: !19, line: 99, type: !44)
!160 = distinct !DILexicalBlock(scope: !157, file: !19, line: 98, column: 9)
!161 = !DILocation(line: 99, column: 20, scope: !160)
!162 = !DILocation(line: 101, column: 20, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !19, line: 101, column: 13)
!164 = !DILocation(line: 101, column: 18, scope: !163)
!165 = !DILocation(line: 101, column: 25, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !19, line: 101, column: 13)
!167 = !DILocation(line: 101, column: 27, scope: !166)
!168 = !DILocation(line: 101, column: 13, scope: !163)
!169 = !DILocation(line: 103, column: 34, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !19, line: 102, column: 13)
!171 = !DILocation(line: 103, column: 27, scope: !170)
!172 = !DILocation(line: 103, column: 17, scope: !170)
!173 = !DILocation(line: 103, column: 22, scope: !170)
!174 = !DILocation(line: 103, column: 25, scope: !170)
!175 = !DILocation(line: 104, column: 13, scope: !170)
!176 = !DILocation(line: 101, column: 35, scope: !166)
!177 = !DILocation(line: 101, column: 13, scope: !166)
!178 = distinct !{!178, !168, !179, !66}
!179 = !DILocation(line: 104, column: 13, scope: !163)
!180 = !DILocation(line: 105, column: 31, scope: !160)
!181 = !DILocation(line: 105, column: 13, scope: !160)
!182 = !DILocation(line: 106, column: 18, scope: !160)
!183 = !DILocation(line: 106, column: 13, scope: !160)
!184 = !DILocation(line: 109, column: 1, scope: !141)
