; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !36
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !50
  store i8 0, i8* %arrayidx3, align 1, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %1, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !59
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !59
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !59
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !63
  store i8 %4, i8* %arrayidx5, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %6, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !71
  store i8 0, i8* %arrayidx6, align 1, !dbg !72
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !73
  call void @printLine(i8* %arraydecay7), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_05_good() #0 !dbg !76 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #5, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #5, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE127_Buffer_Underread__char_declare_loop_05_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE127_Buffer_Underread__char_declare_loop_05_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !103
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %0 = load i32, i32* @staticFalse, align 4, !dbg !106
  %tobool = icmp ne i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !112
  store i8* %arraydecay1, i8** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %1, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !130
  %3 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !130
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !130
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !134
  store i8 %4, i8* %arrayidx5, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %6, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx6, align 1, !dbg !142
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  call void @printLine(i8* %arraydecay7), !dbg !144
  ret void, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !146 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !151
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %0 = load i32, i32* @staticTrue, align 4, !dbg !154
  %tobool = icmp ne i32 %0, 0, !dbg !154
  br i1 %tobool, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !157
  store i8* %arraydecay1, i8** %data, align 8, !dbg !159
  br label %if.end, !dbg !160

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !166
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx3, align 1, !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !172
  %cmp = icmp ult i64 %1, 100, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !176
  %3 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !176
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !176
  %5 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !180
  store i8 %4, i8* %arrayidx5, align 1, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %6, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !187
  store i8 0, i8* %arrayidx6, align 1, !dbg !188
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !189
  call void @printLine(i8* %arraydecay7), !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 23, scope: !18)
!33 = !DILocation(line: 36, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!35 = !DILocation(line: 36, column: 8, scope: !18)
!36 = !DILocation(line: 39, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 37, column: 5)
!38 = !DILocation(line: 39, column: 27, scope: !37)
!39 = !DILocation(line: 39, column: 14, scope: !37)
!40 = !DILocation(line: 40, column: 5, scope: !37)
!41 = !DILocalVariable(name: "i", scope: !42, file: !10, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 46, baseType: !45)
!44 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!45 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 42, column: 16, scope: !42)
!47 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 43, type: !26)
!48 = !DILocation(line: 43, column: 14, scope: !42)
!49 = !DILocation(line: 44, column: 9, scope: !42)
!50 = !DILocation(line: 45, column: 9, scope: !42)
!51 = !DILocation(line: 45, column: 21, scope: !42)
!52 = !DILocation(line: 47, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !10, line: 47, column: 9)
!54 = !DILocation(line: 47, column: 14, scope: !53)
!55 = !DILocation(line: 47, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !10, line: 47, column: 9)
!57 = !DILocation(line: 47, column: 23, scope: !56)
!58 = !DILocation(line: 47, column: 9, scope: !53)
!59 = !DILocation(line: 49, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !10, line: 48, column: 9)
!61 = !DILocation(line: 49, column: 28, scope: !60)
!62 = !DILocation(line: 49, column: 18, scope: !60)
!63 = !DILocation(line: 49, column: 13, scope: !60)
!64 = !DILocation(line: 49, column: 21, scope: !60)
!65 = !DILocation(line: 50, column: 9, scope: !60)
!66 = !DILocation(line: 47, column: 31, scope: !56)
!67 = !DILocation(line: 47, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 50, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 52, column: 9, scope: !42)
!72 = !DILocation(line: 52, column: 21, scope: !42)
!73 = !DILocation(line: 53, column: 19, scope: !42)
!74 = !DILocation(line: 53, column: 9, scope: !42)
!75 = !DILocation(line: 55, column: 1, scope: !18)
!76 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_05_good", scope: !10, file: !10, line: 122, type: !19, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocation(line: 124, column: 5, scope: !76)
!78 = !DILocation(line: 125, column: 5, scope: !76)
!79 = !DILocation(line: 126, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 138, type: !81, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{!11, !11, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !10, line: 138, type: !11)
!85 = !DILocation(line: 138, column: 14, scope: !80)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !10, line: 138, type: !83)
!87 = !DILocation(line: 138, column: 27, scope: !80)
!88 = !DILocation(line: 141, column: 22, scope: !80)
!89 = !DILocation(line: 141, column: 12, scope: !80)
!90 = !DILocation(line: 141, column: 5, scope: !80)
!91 = !DILocation(line: 143, column: 5, scope: !80)
!92 = !DILocation(line: 144, column: 5, scope: !80)
!93 = !DILocation(line: 145, column: 5, scope: !80)
!94 = !DILocation(line: 148, column: 5, scope: !80)
!95 = !DILocation(line: 149, column: 5, scope: !80)
!96 = !DILocation(line: 150, column: 5, scope: !80)
!97 = !DILocation(line: 152, column: 5, scope: !80)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocalVariable(name: "data", scope: !98, file: !10, line: 64, type: !22)
!100 = !DILocation(line: 64, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !10, line: 65, type: !26)
!102 = !DILocation(line: 65, column: 10, scope: !98)
!103 = !DILocation(line: 66, column: 5, scope: !98)
!104 = !DILocation(line: 67, column: 5, scope: !98)
!105 = !DILocation(line: 67, column: 23, scope: !98)
!106 = !DILocation(line: 68, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !10, line: 68, column: 8)
!108 = !DILocation(line: 68, column: 8, scope: !98)
!109 = !DILocation(line: 71, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !10, line: 69, column: 5)
!111 = !DILocation(line: 72, column: 5, scope: !110)
!112 = !DILocation(line: 76, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !10, line: 74, column: 5)
!114 = !DILocation(line: 76, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !10, line: 79, type: !43)
!116 = distinct !DILexicalBlock(scope: !98, file: !10, line: 78, column: 5)
!117 = !DILocation(line: 79, column: 16, scope: !116)
!118 = !DILocalVariable(name: "dest", scope: !116, file: !10, line: 80, type: !26)
!119 = !DILocation(line: 80, column: 14, scope: !116)
!120 = !DILocation(line: 81, column: 9, scope: !116)
!121 = !DILocation(line: 82, column: 9, scope: !116)
!122 = !DILocation(line: 82, column: 21, scope: !116)
!123 = !DILocation(line: 84, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !116, file: !10, line: 84, column: 9)
!125 = !DILocation(line: 84, column: 14, scope: !124)
!126 = !DILocation(line: 84, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !10, line: 84, column: 9)
!128 = !DILocation(line: 84, column: 23, scope: !127)
!129 = !DILocation(line: 84, column: 9, scope: !124)
!130 = !DILocation(line: 86, column: 23, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !10, line: 85, column: 9)
!132 = !DILocation(line: 86, column: 28, scope: !131)
!133 = !DILocation(line: 86, column: 18, scope: !131)
!134 = !DILocation(line: 86, column: 13, scope: !131)
!135 = !DILocation(line: 86, column: 21, scope: !131)
!136 = !DILocation(line: 87, column: 9, scope: !131)
!137 = !DILocation(line: 84, column: 31, scope: !127)
!138 = !DILocation(line: 84, column: 9, scope: !127)
!139 = distinct !{!139, !129, !140, !70}
!140 = !DILocation(line: 87, column: 9, scope: !124)
!141 = !DILocation(line: 89, column: 9, scope: !116)
!142 = !DILocation(line: 89, column: 21, scope: !116)
!143 = !DILocation(line: 90, column: 19, scope: !116)
!144 = !DILocation(line: 90, column: 9, scope: !116)
!145 = !DILocation(line: 92, column: 1, scope: !98)
!146 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 95, type: !19, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!147 = !DILocalVariable(name: "data", scope: !146, file: !10, line: 97, type: !22)
!148 = !DILocation(line: 97, column: 12, scope: !146)
!149 = !DILocalVariable(name: "dataBuffer", scope: !146, file: !10, line: 98, type: !26)
!150 = !DILocation(line: 98, column: 10, scope: !146)
!151 = !DILocation(line: 99, column: 5, scope: !146)
!152 = !DILocation(line: 100, column: 5, scope: !146)
!153 = !DILocation(line: 100, column: 23, scope: !146)
!154 = !DILocation(line: 101, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !10, line: 101, column: 8)
!156 = !DILocation(line: 101, column: 8, scope: !146)
!157 = !DILocation(line: 104, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !10, line: 102, column: 5)
!159 = !DILocation(line: 104, column: 14, scope: !158)
!160 = !DILocation(line: 105, column: 5, scope: !158)
!161 = !DILocalVariable(name: "i", scope: !162, file: !10, line: 107, type: !43)
!162 = distinct !DILexicalBlock(scope: !146, file: !10, line: 106, column: 5)
!163 = !DILocation(line: 107, column: 16, scope: !162)
!164 = !DILocalVariable(name: "dest", scope: !162, file: !10, line: 108, type: !26)
!165 = !DILocation(line: 108, column: 14, scope: !162)
!166 = !DILocation(line: 109, column: 9, scope: !162)
!167 = !DILocation(line: 110, column: 9, scope: !162)
!168 = !DILocation(line: 110, column: 21, scope: !162)
!169 = !DILocation(line: 112, column: 16, scope: !170)
!170 = distinct !DILexicalBlock(scope: !162, file: !10, line: 112, column: 9)
!171 = !DILocation(line: 112, column: 14, scope: !170)
!172 = !DILocation(line: 112, column: 21, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !10, line: 112, column: 9)
!174 = !DILocation(line: 112, column: 23, scope: !173)
!175 = !DILocation(line: 112, column: 9, scope: !170)
!176 = !DILocation(line: 114, column: 23, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !10, line: 113, column: 9)
!178 = !DILocation(line: 114, column: 28, scope: !177)
!179 = !DILocation(line: 114, column: 18, scope: !177)
!180 = !DILocation(line: 114, column: 13, scope: !177)
!181 = !DILocation(line: 114, column: 21, scope: !177)
!182 = !DILocation(line: 115, column: 9, scope: !177)
!183 = !DILocation(line: 112, column: 31, scope: !173)
!184 = !DILocation(line: 112, column: 9, scope: !173)
!185 = distinct !{!185, !175, !186, !70}
!186 = !DILocation(line: 115, column: 9, scope: !170)
!187 = !DILocation(line: 117, column: 9, scope: !162)
!188 = !DILocation(line: 117, column: 21, scope: !162)
!189 = !DILocation(line: 118, column: 19, scope: !162)
!190 = !DILocation(line: 118, column: 9, scope: !162)
!191 = !DILocation(line: 120, column: 1, scope: !146)
