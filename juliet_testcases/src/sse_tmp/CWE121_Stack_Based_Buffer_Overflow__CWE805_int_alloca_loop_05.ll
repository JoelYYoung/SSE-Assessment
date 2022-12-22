; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %4, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %5, i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %7, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !60
  %9 = load i32, i32* %arrayidx, align 4, !dbg !60
  %10 = load i32*, i32** %data, align 8, !dbg !61
  %11 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !61
  store i32 %9, i32* %arrayidx1, align 4, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %12, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !70
  %14 = load i32, i32* %arrayidx2, align 4, !dbg !70
  call void @printIntLine(i32 %14), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #5, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #5, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 200, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 400, align 16, !dbg !106
  %3 = bitcast i8* %2 to i32*, !dbg !107
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !105
  %4 = load i32, i32* @staticFalse, align 4, !dbg !108
  %tobool = icmp ne i32 %4, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %5, i32** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %7, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !132
  %9 = load i32, i32* %arrayidx, align 4, !dbg !132
  %10 = load i32*, i32** %data, align 8, !dbg !133
  %11 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx1 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !133
  store i32 %9, i32* %arrayidx1, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %12, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !141
  %14 = load i32, i32* %arrayidx2, align 4, !dbg !141
  call void @printIntLine(i32 %14), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = alloca i8, i64 200, align 16, !dbg !149
  %1 = bitcast i8* %0 to i32*, !dbg !150
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = alloca i8, i64 400, align 16, !dbg !153
  %3 = bitcast i8* %2 to i32*, !dbg !154
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !152
  %4 = load i32, i32* @staticTrue, align 4, !dbg !155
  %tobool = icmp ne i32 %4, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !158
  store i32* %5, i32** %data, align 8, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !162, metadata !DIExpression()), !dbg !164
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !171
  %cmp = icmp ult i64 %7, 100, !dbg !173
  br i1 %cmp, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !177
  %9 = load i32, i32* %arrayidx, align 4, !dbg !177
  %10 = load i32*, i32** %data, align 8, !dbg !178
  %11 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx1 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !178
  store i32 %9, i32* %arrayidx1, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !182
  %inc = add i64 %12, 1, !dbg !182
  store i64 %inc, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !186
  %arrayidx2 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !186
  %14 = load i32, i32* %arrayidx2, align 4, !dbg !186
  call void @printIntLine(i32 %14), !dbg !187
  ret void, !dbg !188
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 23, type: !7, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 24, type: !7, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05.c", directory: "/root/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05_bad", scope: !12, file: !12, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 30, type: !6)
!23 = !DILocation(line: 30, column: 11, scope: !19)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !12, line: 31, type: !6)
!25 = !DILocation(line: 31, column: 11, scope: !19)
!26 = !DILocation(line: 31, column: 34, scope: !19)
!27 = !DILocation(line: 31, column: 27, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !12, line: 32, type: !6)
!29 = !DILocation(line: 32, column: 11, scope: !19)
!30 = !DILocation(line: 32, column: 35, scope: !19)
!31 = !DILocation(line: 32, column: 28, scope: !19)
!32 = !DILocation(line: 33, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !19, file: !12, line: 33, column: 8)
!34 = !DILocation(line: 33, column: 8, scope: !19)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 34, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 5, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 40, type: !41)
!40 = distinct !DILexicalBlock(scope: !19, file: !12, line: 39, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 40, column: 13, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !12, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !12, line: 41, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 20, scope: !46)
!51 = !DILocation(line: 44, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !46, file: !12, line: 44, column: 13)
!53 = !DILocation(line: 44, column: 18, scope: !52)
!54 = !DILocation(line: 44, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 44, column: 13)
!56 = !DILocation(line: 44, column: 27, scope: !55)
!57 = !DILocation(line: 44, column: 13, scope: !52)
!58 = !DILocation(line: 46, column: 34, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 45, column: 13)
!60 = !DILocation(line: 46, column: 27, scope: !59)
!61 = !DILocation(line: 46, column: 17, scope: !59)
!62 = !DILocation(line: 46, column: 22, scope: !59)
!63 = !DILocation(line: 46, column: 25, scope: !59)
!64 = !DILocation(line: 47, column: 13, scope: !59)
!65 = !DILocation(line: 44, column: 35, scope: !55)
!66 = !DILocation(line: 44, column: 13, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 47, column: 13, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 48, column: 26, scope: !46)
!71 = !DILocation(line: 48, column: 13, scope: !46)
!72 = !DILocation(line: 51, column: 1, scope: !19)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_05_good", scope: !12, file: !12, line: 112, type: !20, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 114, column: 5, scope: !73)
!75 = !DILocation(line: 115, column: 5, scope: !73)
!76 = !DILocation(line: 116, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !78, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DISubroutineType(types: !79)
!79 = !{!7, !7, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 128, type: !7)
!84 = !DILocation(line: 128, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 128, type: !80)
!86 = !DILocation(line: 128, column: 27, scope: !77)
!87 = !DILocation(line: 131, column: 22, scope: !77)
!88 = !DILocation(line: 131, column: 12, scope: !77)
!89 = !DILocation(line: 131, column: 5, scope: !77)
!90 = !DILocation(line: 133, column: 5, scope: !77)
!91 = !DILocation(line: 134, column: 5, scope: !77)
!92 = !DILocation(line: 135, column: 5, scope: !77)
!93 = !DILocation(line: 138, column: 5, scope: !77)
!94 = !DILocation(line: 139, column: 5, scope: !77)
!95 = !DILocation(line: 140, column: 5, scope: !77)
!96 = !DILocation(line: 142, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 60, type: !6)
!99 = !DILocation(line: 60, column: 11, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !12, line: 61, type: !6)
!101 = !DILocation(line: 61, column: 11, scope: !97)
!102 = !DILocation(line: 61, column: 34, scope: !97)
!103 = !DILocation(line: 61, column: 27, scope: !97)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !12, line: 62, type: !6)
!105 = !DILocation(line: 62, column: 11, scope: !97)
!106 = !DILocation(line: 62, column: 35, scope: !97)
!107 = !DILocation(line: 62, column: 28, scope: !97)
!108 = !DILocation(line: 63, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !97, file: !12, line: 63, column: 8)
!110 = !DILocation(line: 63, column: 8, scope: !97)
!111 = !DILocation(line: 66, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 64, column: 5)
!113 = !DILocation(line: 67, column: 5, scope: !112)
!114 = !DILocation(line: 71, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !12, line: 69, column: 5)
!116 = !DILocation(line: 71, column: 14, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 74, type: !41)
!118 = distinct !DILexicalBlock(scope: !97, file: !12, line: 73, column: 5)
!119 = !DILocation(line: 74, column: 13, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 76, type: !47)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 75, column: 9)
!122 = !DILocation(line: 76, column: 20, scope: !121)
!123 = !DILocation(line: 78, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 78, column: 13)
!125 = !DILocation(line: 78, column: 18, scope: !124)
!126 = !DILocation(line: 78, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 78, column: 13)
!128 = !DILocation(line: 78, column: 27, scope: !127)
!129 = !DILocation(line: 78, column: 13, scope: !124)
!130 = !DILocation(line: 80, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !12, line: 79, column: 13)
!132 = !DILocation(line: 80, column: 27, scope: !131)
!133 = !DILocation(line: 80, column: 17, scope: !131)
!134 = !DILocation(line: 80, column: 22, scope: !131)
!135 = !DILocation(line: 80, column: 25, scope: !131)
!136 = !DILocation(line: 81, column: 13, scope: !131)
!137 = !DILocation(line: 78, column: 35, scope: !127)
!138 = !DILocation(line: 78, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !69}
!140 = !DILocation(line: 81, column: 13, scope: !124)
!141 = !DILocation(line: 82, column: 26, scope: !121)
!142 = !DILocation(line: 82, column: 13, scope: !121)
!143 = !DILocation(line: 85, column: 1, scope: !97)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !20, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocalVariable(name: "data", scope: !144, file: !12, line: 90, type: !6)
!146 = !DILocation(line: 90, column: 11, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !12, line: 91, type: !6)
!148 = !DILocation(line: 91, column: 11, scope: !144)
!149 = !DILocation(line: 91, column: 34, scope: !144)
!150 = !DILocation(line: 91, column: 27, scope: !144)
!151 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !12, line: 92, type: !6)
!152 = !DILocation(line: 92, column: 11, scope: !144)
!153 = !DILocation(line: 92, column: 35, scope: !144)
!154 = !DILocation(line: 92, column: 28, scope: !144)
!155 = !DILocation(line: 93, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !144, file: !12, line: 93, column: 8)
!157 = !DILocation(line: 93, column: 8, scope: !144)
!158 = !DILocation(line: 96, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 94, column: 5)
!160 = !DILocation(line: 96, column: 14, scope: !159)
!161 = !DILocation(line: 97, column: 5, scope: !159)
!162 = !DILocalVariable(name: "source", scope: !163, file: !12, line: 99, type: !41)
!163 = distinct !DILexicalBlock(scope: !144, file: !12, line: 98, column: 5)
!164 = !DILocation(line: 99, column: 13, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !166, file: !12, line: 101, type: !47)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 100, column: 9)
!167 = !DILocation(line: 101, column: 20, scope: !166)
!168 = !DILocation(line: 103, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 103, column: 13)
!170 = !DILocation(line: 103, column: 18, scope: !169)
!171 = !DILocation(line: 103, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !12, line: 103, column: 13)
!173 = !DILocation(line: 103, column: 27, scope: !172)
!174 = !DILocation(line: 103, column: 13, scope: !169)
!175 = !DILocation(line: 105, column: 34, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !12, line: 104, column: 13)
!177 = !DILocation(line: 105, column: 27, scope: !176)
!178 = !DILocation(line: 105, column: 17, scope: !176)
!179 = !DILocation(line: 105, column: 22, scope: !176)
!180 = !DILocation(line: 105, column: 25, scope: !176)
!181 = !DILocation(line: 106, column: 13, scope: !176)
!182 = !DILocation(line: 103, column: 35, scope: !172)
!183 = !DILocation(line: 103, column: 13, scope: !172)
!184 = distinct !{!184, !174, !185, !69}
!185 = !DILocation(line: 106, column: 13, scope: !169)
!186 = !DILocation(line: 107, column: 26, scope: !166)
!187 = !DILocation(line: 107, column: 13, scope: !166)
!188 = !DILocation(line: 110, column: 1, scope: !144)
