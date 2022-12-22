; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !48
  %cmp = icmp ult i64 %1, 100, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !51

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !54
  %3 = load i32, i32* %arrayidx, align 4, !dbg !54
  %4 = load i32*, i32** %data, align 8, !dbg !55
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !55
  store i32 %3, i32* %arrayidx1, align 4, !dbg !57
  br label %for.inc, !dbg !58

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !59
  %inc = add i64 %6, 1, !dbg !59
  store i64 %inc, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !60, !llvm.loop !61

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !64
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !64
  call void @printIntLine(i32 %8), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printIntLine(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08_good() #0 !dbg !67 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !91 {
entry:
  ret i32 1, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i32 @staticReturnsFalse(), !dbg !102
  %tobool = icmp ne i32 %call, 0, !dbg !102
  br i1 %tobool, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !105
  br label %if.end, !dbg !107

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !110
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !120
  %cmp = icmp ult i64 %1, 100, !dbg !122
  br i1 %cmp, label %for.body, label %for.end, !dbg !123

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !126
  %3 = load i32, i32* %arrayidx, align 4, !dbg !126
  %4 = load i32*, i32** %data, align 8, !dbg !127
  %5 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !127
  store i32 %3, i32* %arrayidx1, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %6, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !135
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !135
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !135
  call void @printIntLine(i32 %8), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !138 {
entry:
  ret i32 0, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !140 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %call = call i32 @staticReturnsTrue(), !dbg !147
  %tobool = icmp ne i32 %call, 0, !dbg !147
  br i1 %tobool, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !150
  store i32* %arraydecay, i32** %data, align 8, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !163
  %cmp = icmp ult i64 %1, 100, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !169
  %3 = load i32, i32* %arrayidx, align 4, !dbg !169
  %4 = load i32*, i32** %data, align 8, !dbg !170
  %5 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !170
  store i32 %3, i32* %arrayidx1, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %6, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !178
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !178
  call void @printIntLine(i32 %8), !dbg !179
  ret void, !dbg !180
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 37, column: 11, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 38, column: 9, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 39, column: 9, scope: !11)
!29 = !DILocation(line: 40, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!31 = !DILocation(line: 40, column: 8, scope: !11)
!32 = !DILocation(line: 44, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !12, line: 41, column: 5)
!34 = !DILocation(line: 44, column: 14, scope: !33)
!35 = !DILocation(line: 45, column: 5, scope: !33)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 47, type: !25)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!38 = !DILocation(line: 47, column: 13, scope: !37)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 49, type: !41)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 48, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 46, baseType: !43)
!42 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!43 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!44 = !DILocation(line: 49, column: 20, scope: !40)
!45 = !DILocation(line: 51, column: 20, scope: !46)
!46 = distinct !DILexicalBlock(scope: !40, file: !12, line: 51, column: 13)
!47 = !DILocation(line: 51, column: 18, scope: !46)
!48 = !DILocation(line: 51, column: 25, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 51, column: 13)
!50 = !DILocation(line: 51, column: 27, scope: !49)
!51 = !DILocation(line: 51, column: 13, scope: !46)
!52 = !DILocation(line: 53, column: 34, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 52, column: 13)
!54 = !DILocation(line: 53, column: 27, scope: !53)
!55 = !DILocation(line: 53, column: 17, scope: !53)
!56 = !DILocation(line: 53, column: 22, scope: !53)
!57 = !DILocation(line: 53, column: 25, scope: !53)
!58 = !DILocation(line: 54, column: 13, scope: !53)
!59 = !DILocation(line: 51, column: 35, scope: !49)
!60 = !DILocation(line: 51, column: 13, scope: !49)
!61 = distinct !{!61, !51, !62, !63}
!62 = !DILocation(line: 54, column: 13, scope: !46)
!63 = !{!"llvm.loop.mustprogress"}
!64 = !DILocation(line: 55, column: 26, scope: !40)
!65 = !DILocation(line: 55, column: 13, scope: !40)
!66 = !DILocation(line: 58, column: 1, scope: !11)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_08_good", scope: !12, file: !12, line: 119, type: !13, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 121, column: 5, scope: !67)
!69 = !DILocation(line: 122, column: 5, scope: !67)
!70 = !DILocation(line: 123, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 135, type: !72, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!17, !17, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 135, type: !17)
!78 = !DILocation(line: 135, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 135, type: !74)
!80 = !DILocation(line: 135, column: 27, scope: !71)
!81 = !DILocation(line: 138, column: 22, scope: !71)
!82 = !DILocation(line: 138, column: 12, scope: !71)
!83 = !DILocation(line: 138, column: 5, scope: !71)
!84 = !DILocation(line: 140, column: 5, scope: !71)
!85 = !DILocation(line: 141, column: 5, scope: !71)
!86 = !DILocation(line: 142, column: 5, scope: !71)
!87 = !DILocation(line: 145, column: 5, scope: !71)
!88 = !DILocation(line: 146, column: 5, scope: !71)
!89 = !DILocation(line: 147, column: 5, scope: !71)
!90 = !DILocation(line: 149, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !92, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!17}
!94 = !DILocation(line: 25, column: 5, scope: !91)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 67, type: !16)
!97 = !DILocation(line: 67, column: 11, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 68, type: !20)
!99 = !DILocation(line: 68, column: 9, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 69, type: !25)
!101 = !DILocation(line: 69, column: 9, scope: !95)
!102 = !DILocation(line: 70, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !95, file: !12, line: 70, column: 8)
!104 = !DILocation(line: 70, column: 8, scope: !95)
!105 = !DILocation(line: 73, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 71, column: 5)
!107 = !DILocation(line: 74, column: 5, scope: !106)
!108 = !DILocation(line: 78, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !12, line: 76, column: 5)
!110 = !DILocation(line: 78, column: 14, scope: !109)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 81, type: !25)
!112 = distinct !DILexicalBlock(scope: !95, file: !12, line: 80, column: 5)
!113 = !DILocation(line: 81, column: 13, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !12, line: 83, type: !41)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 82, column: 9)
!116 = !DILocation(line: 83, column: 20, scope: !115)
!117 = !DILocation(line: 85, column: 20, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 85, column: 13)
!119 = !DILocation(line: 85, column: 18, scope: !118)
!120 = !DILocation(line: 85, column: 25, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 85, column: 13)
!122 = !DILocation(line: 85, column: 27, scope: !121)
!123 = !DILocation(line: 85, column: 13, scope: !118)
!124 = !DILocation(line: 87, column: 34, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !12, line: 86, column: 13)
!126 = !DILocation(line: 87, column: 27, scope: !125)
!127 = !DILocation(line: 87, column: 17, scope: !125)
!128 = !DILocation(line: 87, column: 22, scope: !125)
!129 = !DILocation(line: 87, column: 25, scope: !125)
!130 = !DILocation(line: 88, column: 13, scope: !125)
!131 = !DILocation(line: 85, column: 35, scope: !121)
!132 = !DILocation(line: 85, column: 13, scope: !121)
!133 = distinct !{!133, !123, !134, !63}
!134 = !DILocation(line: 88, column: 13, scope: !118)
!135 = !DILocation(line: 89, column: 26, scope: !115)
!136 = !DILocation(line: 89, column: 13, scope: !115)
!137 = !DILocation(line: 92, column: 1, scope: !95)
!138 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !92, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!139 = !DILocation(line: 30, column: 5, scope: !138)
!140 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!141 = !DILocalVariable(name: "data", scope: !140, file: !12, line: 97, type: !16)
!142 = !DILocation(line: 97, column: 11, scope: !140)
!143 = !DILocalVariable(name: "dataBadBuffer", scope: !140, file: !12, line: 98, type: !20)
!144 = !DILocation(line: 98, column: 9, scope: !140)
!145 = !DILocalVariable(name: "dataGoodBuffer", scope: !140, file: !12, line: 99, type: !25)
!146 = !DILocation(line: 99, column: 9, scope: !140)
!147 = !DILocation(line: 100, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !12, line: 100, column: 8)
!149 = !DILocation(line: 100, column: 8, scope: !140)
!150 = !DILocation(line: 103, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 101, column: 5)
!152 = !DILocation(line: 103, column: 14, scope: !151)
!153 = !DILocation(line: 104, column: 5, scope: !151)
!154 = !DILocalVariable(name: "source", scope: !155, file: !12, line: 106, type: !25)
!155 = distinct !DILexicalBlock(scope: !140, file: !12, line: 105, column: 5)
!156 = !DILocation(line: 106, column: 13, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !12, line: 108, type: !41)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 107, column: 9)
!159 = !DILocation(line: 108, column: 20, scope: !158)
!160 = !DILocation(line: 110, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 110, column: 13)
!162 = !DILocation(line: 110, column: 18, scope: !161)
!163 = !DILocation(line: 110, column: 25, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 110, column: 13)
!165 = !DILocation(line: 110, column: 27, scope: !164)
!166 = !DILocation(line: 110, column: 13, scope: !161)
!167 = !DILocation(line: 112, column: 34, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 111, column: 13)
!169 = !DILocation(line: 112, column: 27, scope: !168)
!170 = !DILocation(line: 112, column: 17, scope: !168)
!171 = !DILocation(line: 112, column: 22, scope: !168)
!172 = !DILocation(line: 112, column: 25, scope: !168)
!173 = !DILocation(line: 113, column: 13, scope: !168)
!174 = !DILocation(line: 110, column: 35, scope: !164)
!175 = !DILocation(line: 110, column: 13, scope: !164)
!176 = distinct !{!176, !166, !177, !63}
!177 = !DILocation(line: 113, column: 13, scope: !161)
!178 = !DILocation(line: 114, column: 26, scope: !158)
!179 = !DILocation(line: 114, column: 13, scope: !158)
!180 = !DILocation(line: 117, column: 1, scope: !140)
