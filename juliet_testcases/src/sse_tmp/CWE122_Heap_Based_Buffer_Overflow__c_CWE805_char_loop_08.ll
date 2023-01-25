; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx4, align 1, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !53
  %cmp5 = icmp ult i64 %2, 100, !dbg !55
  br i1 %cmp5, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !59
  %4 = load i8, i8* %arrayidx6, align 1, !dbg !59
  %5 = load i8*, i8** %data, align 8, !dbg !60
  %6 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !60
  store i8 %4, i8* %arrayidx7, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %7, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !69
  store i8 0, i8* %arrayidx8, align 1, !dbg !70
  %9 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* %9), !dbg !72
  %10 = load i8*, i8** %data, align 8, !dbg !73
  call void @free(i8* %10) #6, !dbg !74
  ret void, !dbg !75
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* null) #6, !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 %conv) #6, !dbg !91
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08_good(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08_bad(), !dbg !96
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !99 {
entry:
  ret i32 1, !dbg !102
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %call = call i32 @staticReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end3, !dbg !112

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !113
  store i8* %call1, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then2, label %if.end, !dbg !119

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %if.else
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx4, align 1, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !135
  %cmp5 = icmp ult i64 %2, 100, !dbg !137
  br i1 %cmp5, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !141
  %4 = load i8, i8* %arrayidx6, align 1, !dbg !141
  %5 = load i8*, i8** %data, align 8, !dbg !142
  %6 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !142
  store i8 %4, i8* %arrayidx7, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %7, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !150
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !150
  store i8 0, i8* %arrayidx8, align 1, !dbg !151
  %9 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* %9), !dbg !153
  %10 = load i8*, i8** %data, align 8, !dbg !154
  call void @free(i8* %10) #6, !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !157 {
entry:
  ret i32 0, !dbg !158
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !160, metadata !DIExpression()), !dbg !161
  store i8* null, i8** %data, align 8, !dbg !162
  %call = call i32 @staticReturnsTrue(), !dbg !163
  %tobool = icmp ne i32 %call, 0, !dbg !163
  br i1 %tobool, label %if.then, label %if.end3, !dbg !165

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !166
  store i8* %call1, i8** %data, align 8, !dbg !168
  %0 = load i8*, i8** %data, align 8, !dbg !169
  %cmp = icmp eq i8* %0, null, !dbg !171
  br i1 %cmp, label %if.then2, label %if.end, !dbg !172

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !173
  unreachable, !dbg !173

if.end:                                           ; preds = %if.then
  %1 = load i8*, i8** %data, align 8, !dbg !175
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !175
  store i8 0, i8* %arrayidx, align 1, !dbg !176
  br label %if.end3, !dbg !177

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !178, metadata !DIExpression()), !dbg !180
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !181, metadata !DIExpression()), !dbg !182
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !183
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !183
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !184
  store i8 0, i8* %arrayidx4, align 1, !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end3
  %2 = load i64, i64* %i, align 8, !dbg !189
  %cmp5 = icmp ult i64 %2, 100, !dbg !191
  br i1 %cmp5, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %3, !dbg !195
  %4 = load i8, i8* %arrayidx6, align 1, !dbg !195
  %5 = load i8*, i8** %data, align 8, !dbg !196
  %6 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx7 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !196
  store i8 %4, i8* %arrayidx7, align 1, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %7, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !204
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !204
  store i8 0, i8* %arrayidx8, align 1, !dbg !205
  %9 = load i8*, i8** %data, align 8, !dbg !206
  call void @printLine(i8* %9), !dbg !207
  %10 = load i8*, i8** %data, align 8, !dbg !208
  call void @free(i8* %10) #6, !dbg !209
  ret void, !dbg !210
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
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
!36 = !DILocalVariable(name: "i", scope: !37, file: !15, line: 49, type: !38)
!37 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 49, column: 16, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 50, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 50, column: 14, scope: !37)
!47 = !DILocation(line: 51, column: 9, scope: !37)
!48 = !DILocation(line: 52, column: 9, scope: !37)
!49 = !DILocation(line: 52, column: 23, scope: !37)
!50 = !DILocation(line: 54, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !15, line: 54, column: 9)
!52 = !DILocation(line: 54, column: 14, scope: !51)
!53 = !DILocation(line: 54, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !15, line: 54, column: 9)
!55 = !DILocation(line: 54, column: 23, scope: !54)
!56 = !DILocation(line: 54, column: 9, scope: !51)
!57 = !DILocation(line: 56, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 55, column: 9)
!59 = !DILocation(line: 56, column: 23, scope: !58)
!60 = !DILocation(line: 56, column: 13, scope: !58)
!61 = !DILocation(line: 56, column: 18, scope: !58)
!62 = !DILocation(line: 56, column: 21, scope: !58)
!63 = !DILocation(line: 57, column: 9, scope: !58)
!64 = !DILocation(line: 54, column: 31, scope: !54)
!65 = !DILocation(line: 54, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 57, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 58, column: 9, scope: !37)
!70 = !DILocation(line: 58, column: 21, scope: !37)
!71 = !DILocation(line: 59, column: 19, scope: !37)
!72 = !DILocation(line: 59, column: 9, scope: !37)
!73 = !DILocation(line: 60, column: 14, scope: !37)
!74 = !DILocation(line: 60, column: 9, scope: !37)
!75 = !DILocation(line: 62, column: 1, scope: !14)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_08_good", scope: !15, file: !15, line: 129, type: !16, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 131, column: 5, scope: !76)
!78 = !DILocation(line: 132, column: 5, scope: !76)
!79 = !DILocation(line: 133, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 145, type: !81, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !15, line: 145, type: !83)
!86 = !DILocation(line: 145, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !15, line: 145, type: !84)
!88 = !DILocation(line: 145, column: 27, scope: !80)
!89 = !DILocation(line: 148, column: 22, scope: !80)
!90 = !DILocation(line: 148, column: 12, scope: !80)
!91 = !DILocation(line: 148, column: 5, scope: !80)
!92 = !DILocation(line: 150, column: 5, scope: !80)
!93 = !DILocation(line: 151, column: 5, scope: !80)
!94 = !DILocation(line: 152, column: 5, scope: !80)
!95 = !DILocation(line: 155, column: 5, scope: !80)
!96 = !DILocation(line: 156, column: 5, scope: !80)
!97 = !DILocation(line: 157, column: 5, scope: !80)
!98 = !DILocation(line: 159, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !100, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DISubroutineType(types: !101)
!101 = !{!83}
!102 = !DILocation(line: 27, column: 5, scope: !99)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 69, type: !16, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 71, type: !4)
!105 = !DILocation(line: 71, column: 12, scope: !103)
!106 = !DILocation(line: 72, column: 10, scope: !103)
!107 = !DILocation(line: 73, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !15, line: 73, column: 8)
!109 = !DILocation(line: 73, column: 8, scope: !103)
!110 = !DILocation(line: 76, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !15, line: 74, column: 5)
!112 = !DILocation(line: 77, column: 5, scope: !111)
!113 = !DILocation(line: 81, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !15, line: 79, column: 5)
!115 = !DILocation(line: 81, column: 14, scope: !114)
!116 = !DILocation(line: 82, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !15, line: 82, column: 13)
!118 = !DILocation(line: 82, column: 18, scope: !117)
!119 = !DILocation(line: 82, column: 13, scope: !114)
!120 = !DILocation(line: 82, column: 28, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !15, line: 82, column: 27)
!122 = !DILocation(line: 83, column: 9, scope: !114)
!123 = !DILocation(line: 83, column: 17, scope: !114)
!124 = !DILocalVariable(name: "i", scope: !125, file: !15, line: 86, type: !38)
!125 = distinct !DILexicalBlock(scope: !103, file: !15, line: 85, column: 5)
!126 = !DILocation(line: 86, column: 16, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !15, line: 87, type: !43)
!128 = !DILocation(line: 87, column: 14, scope: !125)
!129 = !DILocation(line: 88, column: 9, scope: !125)
!130 = !DILocation(line: 89, column: 9, scope: !125)
!131 = !DILocation(line: 89, column: 23, scope: !125)
!132 = !DILocation(line: 91, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !15, line: 91, column: 9)
!134 = !DILocation(line: 91, column: 14, scope: !133)
!135 = !DILocation(line: 91, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 91, column: 9)
!137 = !DILocation(line: 91, column: 23, scope: !136)
!138 = !DILocation(line: 91, column: 9, scope: !133)
!139 = !DILocation(line: 93, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 92, column: 9)
!141 = !DILocation(line: 93, column: 23, scope: !140)
!142 = !DILocation(line: 93, column: 13, scope: !140)
!143 = !DILocation(line: 93, column: 18, scope: !140)
!144 = !DILocation(line: 93, column: 21, scope: !140)
!145 = !DILocation(line: 94, column: 9, scope: !140)
!146 = !DILocation(line: 91, column: 31, scope: !136)
!147 = !DILocation(line: 91, column: 9, scope: !136)
!148 = distinct !{!148, !138, !149, !68}
!149 = !DILocation(line: 94, column: 9, scope: !133)
!150 = !DILocation(line: 95, column: 9, scope: !125)
!151 = !DILocation(line: 95, column: 21, scope: !125)
!152 = !DILocation(line: 96, column: 19, scope: !125)
!153 = !DILocation(line: 96, column: 9, scope: !125)
!154 = !DILocation(line: 97, column: 14, scope: !125)
!155 = !DILocation(line: 97, column: 9, scope: !125)
!156 = !DILocation(line: 99, column: 1, scope: !103)
!157 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !100, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!158 = !DILocation(line: 32, column: 5, scope: !157)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 102, type: !16, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!160 = !DILocalVariable(name: "data", scope: !159, file: !15, line: 104, type: !4)
!161 = !DILocation(line: 104, column: 12, scope: !159)
!162 = !DILocation(line: 105, column: 10, scope: !159)
!163 = !DILocation(line: 106, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !15, line: 106, column: 8)
!165 = !DILocation(line: 106, column: 8, scope: !159)
!166 = !DILocation(line: 109, column: 24, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !15, line: 107, column: 5)
!168 = !DILocation(line: 109, column: 14, scope: !167)
!169 = !DILocation(line: 110, column: 13, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !15, line: 110, column: 13)
!171 = !DILocation(line: 110, column: 18, scope: !170)
!172 = !DILocation(line: 110, column: 13, scope: !167)
!173 = !DILocation(line: 110, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 110, column: 27)
!175 = !DILocation(line: 111, column: 9, scope: !167)
!176 = !DILocation(line: 111, column: 17, scope: !167)
!177 = !DILocation(line: 112, column: 5, scope: !167)
!178 = !DILocalVariable(name: "i", scope: !179, file: !15, line: 114, type: !38)
!179 = distinct !DILexicalBlock(scope: !159, file: !15, line: 113, column: 5)
!180 = !DILocation(line: 114, column: 16, scope: !179)
!181 = !DILocalVariable(name: "source", scope: !179, file: !15, line: 115, type: !43)
!182 = !DILocation(line: 115, column: 14, scope: !179)
!183 = !DILocation(line: 116, column: 9, scope: !179)
!184 = !DILocation(line: 117, column: 9, scope: !179)
!185 = !DILocation(line: 117, column: 23, scope: !179)
!186 = !DILocation(line: 119, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !179, file: !15, line: 119, column: 9)
!188 = !DILocation(line: 119, column: 14, scope: !187)
!189 = !DILocation(line: 119, column: 21, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !15, line: 119, column: 9)
!191 = !DILocation(line: 119, column: 23, scope: !190)
!192 = !DILocation(line: 119, column: 9, scope: !187)
!193 = !DILocation(line: 121, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !15, line: 120, column: 9)
!195 = !DILocation(line: 121, column: 23, scope: !194)
!196 = !DILocation(line: 121, column: 13, scope: !194)
!197 = !DILocation(line: 121, column: 18, scope: !194)
!198 = !DILocation(line: 121, column: 21, scope: !194)
!199 = !DILocation(line: 122, column: 9, scope: !194)
!200 = !DILocation(line: 119, column: 31, scope: !190)
!201 = !DILocation(line: 119, column: 9, scope: !190)
!202 = distinct !{!202, !192, !203, !68}
!203 = !DILocation(line: 122, column: 9, scope: !187)
!204 = !DILocation(line: 123, column: 9, scope: !179)
!205 = !DILocation(line: 123, column: 21, scope: !179)
!206 = !DILocation(line: 124, column: 19, scope: !179)
!207 = !DILocation(line: 124, column: 9, scope: !179)
!208 = !DILocation(line: 125, column: 14, scope: !179)
!209 = !DILocation(line: 125, column: 9, scope: !179)
!210 = !DILocation(line: 127, column: 1, scope: !159)
