; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i32* null, i32** %data, align 8, !dbg !20
  %call = call i32 @staticReturnsTrue(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end3, !dbg !23

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !24
  %0 = bitcast i8* %call1 to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !50
  %cmp4 = icmp ult i64 %3, 100, !dbg !52
  br i1 %cmp4, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !56
  %5 = load i32, i32* %arrayidx, align 4, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !57
  store i32 %5, i32* %arrayidx5, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %8, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !66
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !66
  call void @printIntLine(i32 %10), !dbg !67
  %11 = load i32*, i32** %data, align 8, !dbg !68
  %12 = bitcast i32* %11 to i8*, !dbg !68
  call void @free(i8* %12) #6, !dbg !69
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

declare dso_local void @printIntLine(i32) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08_good() #0 !dbg !71 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #6, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #6, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !95 {
entry:
  ret i32 1, !dbg !98
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  store i32* null, i32** %data, align 8, !dbg !102
  %call = call i32 @staticReturnsFalse(), !dbg !103
  %tobool = icmp ne i32 %call, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end3, !dbg !108

if.else:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !109
  %0 = bitcast i8* %call1 to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then2, label %if.end, !dbg !116

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !124
  store i64 0, i64* %i, align 8, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !128
  %cmp4 = icmp ult i64 %3, 100, !dbg !130
  br i1 %cmp4, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !134
  %5 = load i32, i32* %arrayidx, align 4, !dbg !134
  %6 = load i32*, i32** %data, align 8, !dbg !135
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !135
  store i32 %5, i32* %arrayidx5, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %8, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !143
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !143
  call void @printIntLine(i32 %10), !dbg !144
  %11 = load i32*, i32** %data, align 8, !dbg !145
  %12 = bitcast i32* %11 to i8*, !dbg !145
  call void @free(i8* %12) #6, !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !148 {
entry:
  ret i32 0, !dbg !149
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !151, metadata !DIExpression()), !dbg !152
  store i32* null, i32** %data, align 8, !dbg !153
  %call = call i32 @staticReturnsTrue(), !dbg !154
  %tobool = icmp ne i32 %call, 0, !dbg !154
  br i1 %tobool, label %if.then, label %if.end3, !dbg !156

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !157
  %0 = bitcast i8* %call1 to i32*, !dbg !159
  store i32* %0, i32** %data, align 8, !dbg !160
  %1 = load i32*, i32** %data, align 8, !dbg !161
  %cmp = icmp eq i32* %1, null, !dbg !163
  br i1 %cmp, label %if.then2, label %if.end, !dbg !164

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !165
  unreachable, !dbg !165

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !167

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end3
  %3 = load i64, i64* %i, align 8, !dbg !177
  %cmp4 = icmp ult i64 %3, 100, !dbg !179
  br i1 %cmp4, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !183
  %5 = load i32, i32* %arrayidx, align 4, !dbg !183
  %6 = load i32*, i32** %data, align 8, !dbg !184
  %7 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !184
  store i32 %5, i32* %arrayidx5, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %8, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !192
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !192
  %10 = load i32, i32* %arrayidx6, align 4, !dbg !192
  call void @printIntLine(i32 %10), !dbg !193
  %11 = load i32*, i32** %data, align 8, !dbg !194
  %12 = bitcast i32* %11 to i8*, !dbg !194
  call void @free(i8* %12) #6, !dbg !195
  ret void, !dbg !196
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !4)
!19 = !DILocation(line: 37, column: 11, scope: !14)
!20 = !DILocation(line: 38, column: 10, scope: !14)
!21 = !DILocation(line: 39, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 39, column: 8)
!23 = !DILocation(line: 39, column: 8, scope: !14)
!24 = !DILocation(line: 42, column: 23, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 40, column: 5)
!26 = !DILocation(line: 42, column: 16, scope: !25)
!27 = !DILocation(line: 42, column: 14, scope: !25)
!28 = !DILocation(line: 43, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 43, column: 13)
!30 = !DILocation(line: 43, column: 18, scope: !29)
!31 = !DILocation(line: 43, column: 13, scope: !25)
!32 = !DILocation(line: 43, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 43, column: 27)
!34 = !DILocation(line: 44, column: 5, scope: !25)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 46, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 45, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 46, column: 13, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !15, line: 48, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !15, line: 47, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 48, column: 20, scope: !42)
!47 = !DILocation(line: 50, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !15, line: 50, column: 13)
!49 = !DILocation(line: 50, column: 18, scope: !48)
!50 = !DILocation(line: 50, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 50, column: 13)
!52 = !DILocation(line: 50, column: 27, scope: !51)
!53 = !DILocation(line: 50, column: 13, scope: !48)
!54 = !DILocation(line: 52, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 51, column: 13)
!56 = !DILocation(line: 52, column: 27, scope: !55)
!57 = !DILocation(line: 52, column: 17, scope: !55)
!58 = !DILocation(line: 52, column: 22, scope: !55)
!59 = !DILocation(line: 52, column: 25, scope: !55)
!60 = !DILocation(line: 53, column: 13, scope: !55)
!61 = !DILocation(line: 50, column: 35, scope: !51)
!62 = !DILocation(line: 50, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 53, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 54, column: 26, scope: !42)
!67 = !DILocation(line: 54, column: 13, scope: !42)
!68 = !DILocation(line: 55, column: 18, scope: !42)
!69 = !DILocation(line: 55, column: 13, scope: !42)
!70 = !DILocation(line: 58, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_08_good", scope: !15, file: !15, line: 121, type: !16, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 123, column: 5, scope: !71)
!73 = !DILocation(line: 124, column: 5, scope: !71)
!74 = !DILocation(line: 125, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 137, type: !76, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!5, !5, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 137, type: !5)
!82 = !DILocation(line: 137, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 137, type: !78)
!84 = !DILocation(line: 137, column: 27, scope: !75)
!85 = !DILocation(line: 140, column: 22, scope: !75)
!86 = !DILocation(line: 140, column: 12, scope: !75)
!87 = !DILocation(line: 140, column: 5, scope: !75)
!88 = !DILocation(line: 142, column: 5, scope: !75)
!89 = !DILocation(line: 143, column: 5, scope: !75)
!90 = !DILocation(line: 144, column: 5, scope: !75)
!91 = !DILocation(line: 147, column: 5, scope: !75)
!92 = !DILocation(line: 148, column: 5, scope: !75)
!93 = !DILocation(line: 149, column: 5, scope: !75)
!94 = !DILocation(line: 151, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 23, type: !96, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!5}
!98 = !DILocation(line: 25, column: 5, scope: !95)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 65, type: !16, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!100 = !DILocalVariable(name: "data", scope: !99, file: !15, line: 67, type: !4)
!101 = !DILocation(line: 67, column: 11, scope: !99)
!102 = !DILocation(line: 68, column: 10, scope: !99)
!103 = !DILocation(line: 69, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !15, line: 69, column: 8)
!105 = !DILocation(line: 69, column: 8, scope: !99)
!106 = !DILocation(line: 72, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !15, line: 70, column: 5)
!108 = !DILocation(line: 73, column: 5, scope: !107)
!109 = !DILocation(line: 77, column: 23, scope: !110)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 75, column: 5)
!111 = !DILocation(line: 77, column: 16, scope: !110)
!112 = !DILocation(line: 77, column: 14, scope: !110)
!113 = !DILocation(line: 78, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 78, column: 13)
!115 = !DILocation(line: 78, column: 18, scope: !114)
!116 = !DILocation(line: 78, column: 13, scope: !110)
!117 = !DILocation(line: 78, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 78, column: 27)
!119 = !DILocalVariable(name: "source", scope: !120, file: !15, line: 81, type: !37)
!120 = distinct !DILexicalBlock(scope: !99, file: !15, line: 80, column: 5)
!121 = !DILocation(line: 81, column: 13, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !123, file: !15, line: 83, type: !43)
!123 = distinct !DILexicalBlock(scope: !120, file: !15, line: 82, column: 9)
!124 = !DILocation(line: 83, column: 20, scope: !123)
!125 = !DILocation(line: 85, column: 20, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !15, line: 85, column: 13)
!127 = !DILocation(line: 85, column: 18, scope: !126)
!128 = !DILocation(line: 85, column: 25, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !15, line: 85, column: 13)
!130 = !DILocation(line: 85, column: 27, scope: !129)
!131 = !DILocation(line: 85, column: 13, scope: !126)
!132 = !DILocation(line: 87, column: 34, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !15, line: 86, column: 13)
!134 = !DILocation(line: 87, column: 27, scope: !133)
!135 = !DILocation(line: 87, column: 17, scope: !133)
!136 = !DILocation(line: 87, column: 22, scope: !133)
!137 = !DILocation(line: 87, column: 25, scope: !133)
!138 = !DILocation(line: 88, column: 13, scope: !133)
!139 = !DILocation(line: 85, column: 35, scope: !129)
!140 = !DILocation(line: 85, column: 13, scope: !129)
!141 = distinct !{!141, !131, !142, !65}
!142 = !DILocation(line: 88, column: 13, scope: !126)
!143 = !DILocation(line: 89, column: 26, scope: !123)
!144 = !DILocation(line: 89, column: 13, scope: !123)
!145 = !DILocation(line: 90, column: 18, scope: !123)
!146 = !DILocation(line: 90, column: 13, scope: !123)
!147 = !DILocation(line: 93, column: 1, scope: !99)
!148 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 28, type: !96, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocation(line: 30, column: 5, scope: !148)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!151 = !DILocalVariable(name: "data", scope: !150, file: !15, line: 98, type: !4)
!152 = !DILocation(line: 98, column: 11, scope: !150)
!153 = !DILocation(line: 99, column: 10, scope: !150)
!154 = !DILocation(line: 100, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !15, line: 100, column: 8)
!156 = !DILocation(line: 100, column: 8, scope: !150)
!157 = !DILocation(line: 103, column: 23, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 101, column: 5)
!159 = !DILocation(line: 103, column: 16, scope: !158)
!160 = !DILocation(line: 103, column: 14, scope: !158)
!161 = !DILocation(line: 104, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !15, line: 104, column: 13)
!163 = !DILocation(line: 104, column: 18, scope: !162)
!164 = !DILocation(line: 104, column: 13, scope: !158)
!165 = !DILocation(line: 104, column: 28, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !15, line: 104, column: 27)
!167 = !DILocation(line: 105, column: 5, scope: !158)
!168 = !DILocalVariable(name: "source", scope: !169, file: !15, line: 107, type: !37)
!169 = distinct !DILexicalBlock(scope: !150, file: !15, line: 106, column: 5)
!170 = !DILocation(line: 107, column: 13, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !15, line: 109, type: !43)
!172 = distinct !DILexicalBlock(scope: !169, file: !15, line: 108, column: 9)
!173 = !DILocation(line: 109, column: 20, scope: !172)
!174 = !DILocation(line: 111, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !15, line: 111, column: 13)
!176 = !DILocation(line: 111, column: 18, scope: !175)
!177 = !DILocation(line: 111, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !15, line: 111, column: 13)
!179 = !DILocation(line: 111, column: 27, scope: !178)
!180 = !DILocation(line: 111, column: 13, scope: !175)
!181 = !DILocation(line: 113, column: 34, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !15, line: 112, column: 13)
!183 = !DILocation(line: 113, column: 27, scope: !182)
!184 = !DILocation(line: 113, column: 17, scope: !182)
!185 = !DILocation(line: 113, column: 22, scope: !182)
!186 = !DILocation(line: 113, column: 25, scope: !182)
!187 = !DILocation(line: 114, column: 13, scope: !182)
!188 = !DILocation(line: 111, column: 35, scope: !178)
!189 = !DILocation(line: 111, column: 13, scope: !178)
!190 = distinct !{!190, !180, !191, !65}
!191 = !DILocation(line: 114, column: 13, scope: !175)
!192 = !DILocation(line: 115, column: 26, scope: !172)
!193 = !DILocation(line: 115, column: 13, scope: !172)
!194 = !DILocation(line: 116, column: 18, scope: !172)
!195 = !DILocation(line: 116, column: 13, scope: !172)
!196 = !DILocation(line: 119, column: 1, scope: !150)
