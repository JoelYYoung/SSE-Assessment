; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %0, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %2, 100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !54
  %4 = load i32, i32* %arrayidx, align 4, !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %6 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !55
  store i32 %4, i32* %arrayidx1, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %7, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !64
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !64
  call void @printIntLine(i32 %9), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #5, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #5, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !98
  %tobool = icmp ne i32 %0, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end, !dbg !103

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !116
  %cmp = icmp ult i64 %2, 100, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !122
  %4 = load i32, i32* %arrayidx, align 4, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  %6 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !123
  store i32 %4, i32* %arrayidx1, align 4, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %7, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !131
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !131
  call void @printIntLine(i32 %9), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !141
  %tobool = icmp ne i32 %0, 0, !dbg !141
  br i1 %tobool, label %if.then, label %if.end, !dbg !143

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  store i32* %arraydecay, i32** %data, align 8, !dbg !146
  br label %if.end, !dbg !147

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !157
  %cmp = icmp ult i64 %2, 100, !dbg !159
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !163
  %4 = load i32, i32* %arrayidx, align 4, !dbg !163
  %5 = load i32*, i32** %data, align 8, !dbg !164
  %6 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !164
  store i32 %4, i32* %arrayidx1, align 4, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %7, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !172
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !172
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !172
  call void @printIntLine(i32 %9), !dbg !173
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 24, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 25, column: 9, scope: !11)
!29 = !DILocation(line: 26, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!31 = !DILocation(line: 26, column: 8, scope: !11)
!32 = !DILocation(line: 30, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 27, column: 5)
!34 = !DILocation(line: 30, column: 14, scope: !33)
!35 = !DILocation(line: 31, column: 5, scope: !33)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 33, type: !25)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!38 = !DILocation(line: 33, column: 13, scope: !37)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 34, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 35, column: 20, scope: !40)
!45 = !DILocation(line: 37, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !12, line: 37, column: 13)
!47 = !DILocation(line: 37, column: 18, scope: !46)
!48 = !DILocation(line: 37, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 37, column: 13)
!50 = !DILocation(line: 37, column: 27, scope: !49)
!51 = !DILocation(line: 37, column: 13, scope: !46)
!52 = !DILocation(line: 39, column: 34, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 38, column: 13)
!54 = !DILocation(line: 39, column: 27, scope: !53)
!55 = !DILocation(line: 39, column: 17, scope: !53)
!56 = !DILocation(line: 39, column: 22, scope: !53)
!57 = !DILocation(line: 39, column: 25, scope: !53)
!58 = !DILocation(line: 40, column: 13, scope: !53)
!59 = !DILocation(line: 37, column: 35, scope: !49)
!60 = !DILocation(line: 37, column: 13, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 40, column: 13, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 41, column: 26, scope: !40)
!65 = !DILocation(line: 41, column: 13, scope: !40)
!66 = !DILocation(line: 44, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_09_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 107, column: 5, scope: !67)
!69 = !DILocation(line: 108, column: 5, scope: !67)
!70 = !DILocation(line: 109, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 121, type: !72, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!17, !17, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 121, type: !17)
!78 = !DILocation(line: 121, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 121, type: !74)
!80 = !DILocation(line: 121, column: 27, scope: !71)
!81 = !DILocation(line: 124, column: 22, scope: !71)
!82 = !DILocation(line: 124, column: 12, scope: !71)
!83 = !DILocation(line: 124, column: 5, scope: !71)
!84 = !DILocation(line: 126, column: 5, scope: !71)
!85 = !DILocation(line: 127, column: 5, scope: !71)
!86 = !DILocation(line: 128, column: 5, scope: !71)
!87 = !DILocation(line: 131, column: 5, scope: !71)
!88 = !DILocation(line: 132, column: 5, scope: !71)
!89 = !DILocation(line: 133, column: 5, scope: !71)
!90 = !DILocation(line: 135, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 51, type: !13, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 53, type: !16)
!93 = !DILocation(line: 53, column: 11, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 54, type: !20)
!95 = !DILocation(line: 54, column: 9, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 55, type: !25)
!97 = !DILocation(line: 55, column: 9, scope: !91)
!98 = !DILocation(line: 56, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !12, line: 56, column: 8)
!100 = !DILocation(line: 56, column: 8, scope: !91)
!101 = !DILocation(line: 59, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 57, column: 5)
!103 = !DILocation(line: 60, column: 5, scope: !102)
!104 = !DILocation(line: 64, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !12, line: 62, column: 5)
!106 = !DILocation(line: 64, column: 14, scope: !105)
!107 = !DILocalVariable(name: "source", scope: !108, file: !12, line: 67, type: !25)
!108 = distinct !DILexicalBlock(scope: !91, file: !12, line: 66, column: 5)
!109 = !DILocation(line: 67, column: 13, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 69, type: !41)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 68, column: 9)
!112 = !DILocation(line: 69, column: 20, scope: !111)
!113 = !DILocation(line: 71, column: 20, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 71, column: 13)
!115 = !DILocation(line: 71, column: 18, scope: !114)
!116 = !DILocation(line: 71, column: 25, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 71, column: 13)
!118 = !DILocation(line: 71, column: 27, scope: !117)
!119 = !DILocation(line: 71, column: 13, scope: !114)
!120 = !DILocation(line: 73, column: 34, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 72, column: 13)
!122 = !DILocation(line: 73, column: 27, scope: !121)
!123 = !DILocation(line: 73, column: 17, scope: !121)
!124 = !DILocation(line: 73, column: 22, scope: !121)
!125 = !DILocation(line: 73, column: 25, scope: !121)
!126 = !DILocation(line: 74, column: 13, scope: !121)
!127 = !DILocation(line: 71, column: 35, scope: !117)
!128 = !DILocation(line: 71, column: 13, scope: !117)
!129 = distinct !{!129, !119, !130, !63}
!130 = !DILocation(line: 74, column: 13, scope: !114)
!131 = !DILocation(line: 75, column: 26, scope: !111)
!132 = !DILocation(line: 75, column: 13, scope: !111)
!133 = !DILocation(line: 78, column: 1, scope: !91)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!135 = !DILocalVariable(name: "data", scope: !134, file: !12, line: 83, type: !16)
!136 = !DILocation(line: 83, column: 11, scope: !134)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !134, file: !12, line: 84, type: !20)
!138 = !DILocation(line: 84, column: 9, scope: !134)
!139 = !DILocalVariable(name: "dataGoodBuffer", scope: !134, file: !12, line: 85, type: !25)
!140 = !DILocation(line: 85, column: 9, scope: !134)
!141 = !DILocation(line: 86, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !134, file: !12, line: 86, column: 8)
!143 = !DILocation(line: 86, column: 8, scope: !134)
!144 = !DILocation(line: 89, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 87, column: 5)
!146 = !DILocation(line: 89, column: 14, scope: !145)
!147 = !DILocation(line: 90, column: 5, scope: !145)
!148 = !DILocalVariable(name: "source", scope: !149, file: !12, line: 92, type: !25)
!149 = distinct !DILexicalBlock(scope: !134, file: !12, line: 91, column: 5)
!150 = !DILocation(line: 92, column: 13, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !12, line: 94, type: !41)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 93, column: 9)
!153 = !DILocation(line: 94, column: 20, scope: !152)
!154 = !DILocation(line: 96, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 96, column: 13)
!156 = !DILocation(line: 96, column: 18, scope: !155)
!157 = !DILocation(line: 96, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 96, column: 13)
!159 = !DILocation(line: 96, column: 27, scope: !158)
!160 = !DILocation(line: 96, column: 13, scope: !155)
!161 = !DILocation(line: 98, column: 34, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 97, column: 13)
!163 = !DILocation(line: 98, column: 27, scope: !162)
!164 = !DILocation(line: 98, column: 17, scope: !162)
!165 = !DILocation(line: 98, column: 22, scope: !162)
!166 = !DILocation(line: 98, column: 25, scope: !162)
!167 = !DILocation(line: 99, column: 13, scope: !162)
!168 = !DILocation(line: 96, column: 35, scope: !158)
!169 = !DILocation(line: 96, column: 13, scope: !158)
!170 = distinct !{!170, !160, !171, !63}
!171 = !DILocation(line: 99, column: 13, scope: !155)
!172 = !DILocation(line: 100, column: 26, scope: !152)
!173 = !DILocation(line: 100, column: 13, scope: !152)
!174 = !DILocation(line: 103, column: 1, scope: !134)
