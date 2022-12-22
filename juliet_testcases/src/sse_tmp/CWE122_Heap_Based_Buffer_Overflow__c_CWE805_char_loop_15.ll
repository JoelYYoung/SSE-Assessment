; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx1, align 1, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !48
  %cmp2 = icmp ult i64 %2, 100, !dbg !50
  br i1 %cmp2, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !54
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !55
  store i8 %4, i8* %arrayidx4, align 1, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %7, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !64
  store i8 0, i8* %arrayidx5, align 1, !dbg !65
  %9 = load i8*, i8** %data, align 8, !dbg !66
  call void @printLine(i8* %9), !dbg !67
  %10 = load i8*, i8** %data, align 8, !dbg !68
  call void @free(i8* %10) #6, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  store i8* null, i8** %data, align 8, !dbg !97
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !98
  store i8* %call, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %cmp = icmp eq i8* %0, null, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !104
  unreachable, !dbg !104

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !113
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx1, align 1, !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !119
  %cmp2 = icmp ult i64 %2, 100, !dbg !121
  br i1 %cmp2, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !125
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !125
  %5 = load i8*, i8** %data, align 8, !dbg !126
  %6 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !126
  store i8 %4, i8* %arrayidx4, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %7, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !134
  store i8 0, i8* %arrayidx5, align 1, !dbg !135
  %9 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %9), !dbg !137
  %10 = load i8*, i8** %data, align 8, !dbg !138
  call void @free(i8* %10) #6, !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  store i8* null, i8** %data, align 8, !dbg !144
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !145
  store i8* %call, i8** %data, align 8, !dbg !146
  %0 = load i8*, i8** %data, align 8, !dbg !147
  %cmp = icmp eq i8* %0, null, !dbg !149
  br i1 %cmp, label %if.then, label %if.end, !dbg !150

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !158, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !160
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !161
  store i8 0, i8* %arrayidx1, align 1, !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !166
  %cmp2 = icmp ult i64 %2, 100, !dbg !168
  br i1 %cmp2, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !172
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !172
  %5 = load i8*, i8** %data, align 8, !dbg !173
  %6 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !173
  store i8 %4, i8* %arrayidx4, align 1, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %7, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !181
  %arrayidx5 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !181
  store i8 0, i8* %arrayidx5, align 1, !dbg !182
  %9 = load i8*, i8** %data, align 8, !dbg !183
  call void @printLine(i8* %9), !dbg !184
  %10 = load i8*, i8** %data, align 8, !dbg !185
  call void @free(i8* %10) #6, !dbg !186
  ret void, !dbg !187
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 31, column: 24, scope: !14)
!22 = !DILocation(line: 31, column: 14, scope: !14)
!23 = !DILocation(line: 32, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!25 = !DILocation(line: 32, column: 18, scope: !24)
!26 = !DILocation(line: 32, column: 13, scope: !14)
!27 = !DILocation(line: 32, column: 28, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 32, column: 27)
!29 = !DILocation(line: 33, column: 9, scope: !14)
!30 = !DILocation(line: 33, column: 17, scope: !14)
!31 = !DILocalVariable(name: "i", scope: !32, file: !15, line: 41, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !34, line: 46, baseType: !35)
!34 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!35 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 41, column: 16, scope: !32)
!37 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 42, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 42, column: 14, scope: !32)
!42 = !DILocation(line: 43, column: 9, scope: !32)
!43 = !DILocation(line: 44, column: 9, scope: !32)
!44 = !DILocation(line: 44, column: 23, scope: !32)
!45 = !DILocation(line: 46, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !32, file: !15, line: 46, column: 9)
!47 = !DILocation(line: 46, column: 14, scope: !46)
!48 = !DILocation(line: 46, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 46, column: 9)
!50 = !DILocation(line: 46, column: 23, scope: !49)
!51 = !DILocation(line: 46, column: 9, scope: !46)
!52 = !DILocation(line: 48, column: 30, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !15, line: 47, column: 9)
!54 = !DILocation(line: 48, column: 23, scope: !53)
!55 = !DILocation(line: 48, column: 13, scope: !53)
!56 = !DILocation(line: 48, column: 18, scope: !53)
!57 = !DILocation(line: 48, column: 21, scope: !53)
!58 = !DILocation(line: 49, column: 9, scope: !53)
!59 = !DILocation(line: 46, column: 31, scope: !49)
!60 = !DILocation(line: 46, column: 9, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 49, column: 9, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 50, column: 9, scope: !32)
!65 = !DILocation(line: 50, column: 21, scope: !32)
!66 = !DILocation(line: 51, column: 19, scope: !32)
!67 = !DILocation(line: 51, column: 9, scope: !32)
!68 = !DILocation(line: 52, column: 14, scope: !32)
!69 = !DILocation(line: 52, column: 9, scope: !32)
!70 = !DILocation(line: 54, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_15_good", scope: !15, file: !15, line: 128, type: !16, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 130, column: 5, scope: !71)
!73 = !DILocation(line: 131, column: 5, scope: !71)
!74 = !DILocation(line: 132, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 144, type: !76, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 144, type: !78)
!81 = !DILocation(line: 144, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 144, type: !79)
!83 = !DILocation(line: 144, column: 27, scope: !75)
!84 = !DILocation(line: 147, column: 22, scope: !75)
!85 = !DILocation(line: 147, column: 12, scope: !75)
!86 = !DILocation(line: 147, column: 5, scope: !75)
!87 = !DILocation(line: 149, column: 5, scope: !75)
!88 = !DILocation(line: 150, column: 5, scope: !75)
!89 = !DILocation(line: 151, column: 5, scope: !75)
!90 = !DILocation(line: 154, column: 5, scope: !75)
!91 = !DILocation(line: 155, column: 5, scope: !75)
!92 = !DILocation(line: 156, column: 5, scope: !75)
!93 = !DILocation(line: 158, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 63, type: !4)
!96 = !DILocation(line: 63, column: 12, scope: !94)
!97 = !DILocation(line: 64, column: 10, scope: !94)
!98 = !DILocation(line: 73, column: 24, scope: !94)
!99 = !DILocation(line: 73, column: 14, scope: !94)
!100 = !DILocation(line: 74, column: 13, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !15, line: 74, column: 13)
!102 = !DILocation(line: 74, column: 18, scope: !101)
!103 = !DILocation(line: 74, column: 13, scope: !94)
!104 = !DILocation(line: 74, column: 28, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 74, column: 27)
!106 = !DILocation(line: 75, column: 9, scope: !94)
!107 = !DILocation(line: 75, column: 17, scope: !94)
!108 = !DILocalVariable(name: "i", scope: !109, file: !15, line: 79, type: !33)
!109 = distinct !DILexicalBlock(scope: !94, file: !15, line: 78, column: 5)
!110 = !DILocation(line: 79, column: 16, scope: !109)
!111 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 80, type: !38)
!112 = !DILocation(line: 80, column: 14, scope: !109)
!113 = !DILocation(line: 81, column: 9, scope: !109)
!114 = !DILocation(line: 82, column: 9, scope: !109)
!115 = !DILocation(line: 82, column: 23, scope: !109)
!116 = !DILocation(line: 84, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !15, line: 84, column: 9)
!118 = !DILocation(line: 84, column: 14, scope: !117)
!119 = !DILocation(line: 84, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !15, line: 84, column: 9)
!121 = !DILocation(line: 84, column: 23, scope: !120)
!122 = !DILocation(line: 84, column: 9, scope: !117)
!123 = !DILocation(line: 86, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 85, column: 9)
!125 = !DILocation(line: 86, column: 23, scope: !124)
!126 = !DILocation(line: 86, column: 13, scope: !124)
!127 = !DILocation(line: 86, column: 18, scope: !124)
!128 = !DILocation(line: 86, column: 21, scope: !124)
!129 = !DILocation(line: 87, column: 9, scope: !124)
!130 = !DILocation(line: 84, column: 31, scope: !120)
!131 = !DILocation(line: 84, column: 9, scope: !120)
!132 = distinct !{!132, !122, !133, !63}
!133 = !DILocation(line: 87, column: 9, scope: !117)
!134 = !DILocation(line: 88, column: 9, scope: !109)
!135 = !DILocation(line: 88, column: 21, scope: !109)
!136 = !DILocation(line: 89, column: 19, scope: !109)
!137 = !DILocation(line: 89, column: 9, scope: !109)
!138 = !DILocation(line: 90, column: 14, scope: !109)
!139 = !DILocation(line: 90, column: 9, scope: !109)
!140 = !DILocation(line: 92, column: 1, scope: !94)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 95, type: !16, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !15, line: 97, type: !4)
!143 = !DILocation(line: 97, column: 12, scope: !141)
!144 = !DILocation(line: 98, column: 10, scope: !141)
!145 = !DILocation(line: 103, column: 24, scope: !141)
!146 = !DILocation(line: 103, column: 14, scope: !141)
!147 = !DILocation(line: 104, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !141, file: !15, line: 104, column: 13)
!149 = !DILocation(line: 104, column: 18, scope: !148)
!150 = !DILocation(line: 104, column: 13, scope: !141)
!151 = !DILocation(line: 104, column: 28, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !15, line: 104, column: 27)
!153 = !DILocation(line: 105, column: 9, scope: !141)
!154 = !DILocation(line: 105, column: 17, scope: !141)
!155 = !DILocalVariable(name: "i", scope: !156, file: !15, line: 113, type: !33)
!156 = distinct !DILexicalBlock(scope: !141, file: !15, line: 112, column: 5)
!157 = !DILocation(line: 113, column: 16, scope: !156)
!158 = !DILocalVariable(name: "source", scope: !156, file: !15, line: 114, type: !38)
!159 = !DILocation(line: 114, column: 14, scope: !156)
!160 = !DILocation(line: 115, column: 9, scope: !156)
!161 = !DILocation(line: 116, column: 9, scope: !156)
!162 = !DILocation(line: 116, column: 23, scope: !156)
!163 = !DILocation(line: 118, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !15, line: 118, column: 9)
!165 = !DILocation(line: 118, column: 14, scope: !164)
!166 = !DILocation(line: 118, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 118, column: 9)
!168 = !DILocation(line: 118, column: 23, scope: !167)
!169 = !DILocation(line: 118, column: 9, scope: !164)
!170 = !DILocation(line: 120, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !15, line: 119, column: 9)
!172 = !DILocation(line: 120, column: 23, scope: !171)
!173 = !DILocation(line: 120, column: 13, scope: !171)
!174 = !DILocation(line: 120, column: 18, scope: !171)
!175 = !DILocation(line: 120, column: 21, scope: !171)
!176 = !DILocation(line: 121, column: 9, scope: !171)
!177 = !DILocation(line: 118, column: 31, scope: !167)
!178 = !DILocation(line: 118, column: 9, scope: !167)
!179 = distinct !{!179, !169, !180, !63}
!180 = !DILocation(line: 121, column: 9, scope: !164)
!181 = !DILocation(line: 122, column: 9, scope: !156)
!182 = !DILocation(line: 122, column: 21, scope: !156)
!183 = !DILocation(line: 123, column: 19, scope: !156)
!184 = !DILocation(line: 123, column: 9, scope: !156)
!185 = !DILocation(line: 124, column: 14, scope: !156)
!186 = !DILocation(line: 124, column: 9, scope: !156)
!187 = !DILocation(line: 126, column: 1, scope: !141)
