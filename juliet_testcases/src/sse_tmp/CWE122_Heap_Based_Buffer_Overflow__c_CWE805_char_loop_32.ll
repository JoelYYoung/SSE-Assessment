; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !26, metadata !DIExpression()), !dbg !28
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !29
  %1 = load i8*, i8** %0, align 8, !dbg !30
  store i8* %1, i8** %data1, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !31
  store i8* %call, i8** %data1, align 8, !dbg !32
  %2 = load i8*, i8** %data1, align 8, !dbg !33
  %cmp = icmp eq i8* %2, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %4 = load i8*, i8** %data1, align 8, !dbg !41
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !42
  store i8* %4, i8** %5, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !47
  %7 = load i8*, i8** %6, align 8, !dbg !48
  store i8* %7, i8** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx3, align 1, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !66
  %cmp4 = icmp ult i64 %8, 100, !dbg !68
  br i1 %cmp4, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %9, !dbg !72
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !72
  %11 = load i8*, i8** %data2, align 8, !dbg !73
  %12 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !73
  store i8 %10, i8* %arrayidx6, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %13, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data2, align 8, !dbg !82
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 99, !dbg !82
  store i8 0, i8* %arrayidx7, align 1, !dbg !83
  %15 = load i8*, i8** %data2, align 8, !dbg !84
  call void @printLine(i8* %15), !dbg !85
  %16 = load i8*, i8** %data2, align 8, !dbg !86
  call void @free(i8* %16) #6, !dbg !87
  ret void, !dbg !88
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #6, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #6, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !116
  store i8* null, i8** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !121
  %1 = load i8*, i8** %0, align 8, !dbg !122
  store i8* %1, i8** %data1, align 8, !dbg !120
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !123
  store i8* %call, i8** %data1, align 8, !dbg !124
  %2 = load i8*, i8** %data1, align 8, !dbg !125
  %cmp = icmp eq i8* %2, null, !dbg !127
  br i1 %cmp, label %if.then, label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !129
  unreachable, !dbg !129

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  %4 = load i8*, i8** %data1, align 8, !dbg !133
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !134
  store i8* %4, i8** %5, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !136, metadata !DIExpression()), !dbg !138
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !139
  %7 = load i8*, i8** %6, align 8, !dbg !140
  store i8* %7, i8** %data2, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !146
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !147
  store i8 0, i8* %arrayidx3, align 1, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !152
  %cmp4 = icmp ult i64 %8, 100, !dbg !154
  br i1 %cmp4, label %for.body, label %for.end, !dbg !155

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %9, !dbg !158
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !158
  %11 = load i8*, i8** %data2, align 8, !dbg !159
  %12 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !159
  store i8 %10, i8* %arrayidx6, align 1, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %13, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  %14 = load i8*, i8** %data2, align 8, !dbg !167
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 99, !dbg !167
  store i8 0, i8* %arrayidx7, align 1, !dbg !168
  %15 = load i8*, i8** %data2, align 8, !dbg !169
  call void @printLine(i8* %15), !dbg !170
  %16 = load i8*, i8** %data2, align 8, !dbg !171
  call void @free(i8* %16) #6, !dbg !172
  ret void, !dbg !173
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !14)
!23 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !14)
!25 = !DILocation(line: 28, column: 10, scope: !14)
!26 = !DILocalVariable(name: "data", scope: !27, file: !15, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 24, scope: !27)
!30 = !DILocation(line: 30, column: 23, scope: !27)
!31 = !DILocation(line: 32, column: 24, scope: !27)
!32 = !DILocation(line: 32, column: 14, scope: !27)
!33 = !DILocation(line: 33, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !15, line: 33, column: 13)
!35 = !DILocation(line: 33, column: 18, scope: !34)
!36 = !DILocation(line: 33, column: 13, scope: !27)
!37 = !DILocation(line: 33, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !15, line: 33, column: 27)
!39 = !DILocation(line: 34, column: 9, scope: !27)
!40 = !DILocation(line: 34, column: 17, scope: !27)
!41 = !DILocation(line: 35, column: 21, scope: !27)
!42 = !DILocation(line: 35, column: 10, scope: !27)
!43 = !DILocation(line: 35, column: 19, scope: !27)
!44 = !DILocalVariable(name: "data", scope: !45, file: !15, line: 38, type: !4)
!45 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!46 = !DILocation(line: 38, column: 16, scope: !45)
!47 = !DILocation(line: 38, column: 24, scope: !45)
!48 = !DILocation(line: 38, column: 23, scope: !45)
!49 = !DILocalVariable(name: "i", scope: !50, file: !15, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !45, file: !15, line: 39, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 40, column: 20, scope: !50)
!55 = !DILocalVariable(name: "source", scope: !50, file: !15, line: 41, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 41, column: 18, scope: !50)
!60 = !DILocation(line: 42, column: 13, scope: !50)
!61 = !DILocation(line: 43, column: 13, scope: !50)
!62 = !DILocation(line: 43, column: 27, scope: !50)
!63 = !DILocation(line: 45, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !50, file: !15, line: 45, column: 13)
!65 = !DILocation(line: 45, column: 18, scope: !64)
!66 = !DILocation(line: 45, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 45, column: 13)
!68 = !DILocation(line: 45, column: 27, scope: !67)
!69 = !DILocation(line: 45, column: 13, scope: !64)
!70 = !DILocation(line: 47, column: 34, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 46, column: 13)
!72 = !DILocation(line: 47, column: 27, scope: !71)
!73 = !DILocation(line: 47, column: 17, scope: !71)
!74 = !DILocation(line: 47, column: 22, scope: !71)
!75 = !DILocation(line: 47, column: 25, scope: !71)
!76 = !DILocation(line: 48, column: 13, scope: !71)
!77 = !DILocation(line: 45, column: 35, scope: !67)
!78 = !DILocation(line: 45, column: 13, scope: !67)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 48, column: 13, scope: !64)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 49, column: 13, scope: !50)
!83 = !DILocation(line: 49, column: 25, scope: !50)
!84 = !DILocation(line: 50, column: 23, scope: !50)
!85 = !DILocation(line: 50, column: 13, scope: !50)
!86 = !DILocation(line: 51, column: 18, scope: !50)
!87 = !DILocation(line: 51, column: 13, scope: !50)
!88 = !DILocation(line: 54, column: 1, scope: !14)
!89 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_32_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 96, column: 5, scope: !89)
!91 = !DILocation(line: 97, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 108, type: !93, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !95, !21}
!95 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !15, line: 108, type: !95)
!97 = !DILocation(line: 108, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !15, line: 108, type: !21)
!99 = !DILocation(line: 108, column: 27, scope: !92)
!100 = !DILocation(line: 111, column: 22, scope: !92)
!101 = !DILocation(line: 111, column: 12, scope: !92)
!102 = !DILocation(line: 111, column: 5, scope: !92)
!103 = !DILocation(line: 113, column: 5, scope: !92)
!104 = !DILocation(line: 114, column: 5, scope: !92)
!105 = !DILocation(line: 115, column: 5, scope: !92)
!106 = !DILocation(line: 118, column: 5, scope: !92)
!107 = !DILocation(line: 119, column: 5, scope: !92)
!108 = !DILocation(line: 120, column: 5, scope: !92)
!109 = !DILocation(line: 122, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 63, type: !4)
!112 = !DILocation(line: 63, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataPtr1", scope: !110, file: !15, line: 64, type: !21)
!114 = !DILocation(line: 64, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataPtr2", scope: !110, file: !15, line: 65, type: !21)
!116 = !DILocation(line: 65, column: 13, scope: !110)
!117 = !DILocation(line: 66, column: 10, scope: !110)
!118 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 68, type: !4)
!119 = distinct !DILexicalBlock(scope: !110, file: !15, line: 67, column: 5)
!120 = !DILocation(line: 68, column: 16, scope: !119)
!121 = !DILocation(line: 68, column: 24, scope: !119)
!122 = !DILocation(line: 68, column: 23, scope: !119)
!123 = !DILocation(line: 70, column: 24, scope: !119)
!124 = !DILocation(line: 70, column: 14, scope: !119)
!125 = !DILocation(line: 71, column: 13, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !15, line: 71, column: 13)
!127 = !DILocation(line: 71, column: 18, scope: !126)
!128 = !DILocation(line: 71, column: 13, scope: !119)
!129 = !DILocation(line: 71, column: 28, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !15, line: 71, column: 27)
!131 = !DILocation(line: 72, column: 9, scope: !119)
!132 = !DILocation(line: 72, column: 17, scope: !119)
!133 = !DILocation(line: 73, column: 21, scope: !119)
!134 = !DILocation(line: 73, column: 10, scope: !119)
!135 = !DILocation(line: 73, column: 19, scope: !119)
!136 = !DILocalVariable(name: "data", scope: !137, file: !15, line: 76, type: !4)
!137 = distinct !DILexicalBlock(scope: !110, file: !15, line: 75, column: 5)
!138 = !DILocation(line: 76, column: 16, scope: !137)
!139 = !DILocation(line: 76, column: 24, scope: !137)
!140 = !DILocation(line: 76, column: 23, scope: !137)
!141 = !DILocalVariable(name: "i", scope: !142, file: !15, line: 78, type: !51)
!142 = distinct !DILexicalBlock(scope: !137, file: !15, line: 77, column: 9)
!143 = !DILocation(line: 78, column: 20, scope: !142)
!144 = !DILocalVariable(name: "source", scope: !142, file: !15, line: 79, type: !56)
!145 = !DILocation(line: 79, column: 18, scope: !142)
!146 = !DILocation(line: 80, column: 13, scope: !142)
!147 = !DILocation(line: 81, column: 13, scope: !142)
!148 = !DILocation(line: 81, column: 27, scope: !142)
!149 = !DILocation(line: 83, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !15, line: 83, column: 13)
!151 = !DILocation(line: 83, column: 18, scope: !150)
!152 = !DILocation(line: 83, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !15, line: 83, column: 13)
!154 = !DILocation(line: 83, column: 27, scope: !153)
!155 = !DILocation(line: 83, column: 13, scope: !150)
!156 = !DILocation(line: 85, column: 34, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !15, line: 84, column: 13)
!158 = !DILocation(line: 85, column: 27, scope: !157)
!159 = !DILocation(line: 85, column: 17, scope: !157)
!160 = !DILocation(line: 85, column: 22, scope: !157)
!161 = !DILocation(line: 85, column: 25, scope: !157)
!162 = !DILocation(line: 86, column: 13, scope: !157)
!163 = !DILocation(line: 83, column: 35, scope: !153)
!164 = !DILocation(line: 83, column: 13, scope: !153)
!165 = distinct !{!165, !155, !166, !81}
!166 = !DILocation(line: 86, column: 13, scope: !150)
!167 = !DILocation(line: 87, column: 13, scope: !142)
!168 = !DILocation(line: 87, column: 25, scope: !142)
!169 = !DILocation(line: 88, column: 23, scope: !142)
!170 = !DILocation(line: 88, column: 13, scope: !142)
!171 = !DILocation(line: 89, column: 18, scope: !142)
!172 = !DILocation(line: 89, column: 13, scope: !142)
!173 = !DILocation(line: 92, column: 1, scope: !110)
