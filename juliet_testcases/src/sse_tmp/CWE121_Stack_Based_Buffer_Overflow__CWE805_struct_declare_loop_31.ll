; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !41, metadata !DIExpression()), !dbg !42
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !43
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %2, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %4 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %5, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !75, metadata !DIExpression()), !dbg !77
  store i64 0, i64* %i3, align 8, !dbg !78
  br label %for.cond4, !dbg !80

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !81
  %cmp5 = icmp ult i64 %6, 100, !dbg !83
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !84

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !85
  %8 = load i64, i64* %i3, align 8, !dbg !87
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !85
  %9 = load i64, i64* %i3, align 8, !dbg !88
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !89
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !89
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !89
  br label %for.inc9, !dbg !90

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !91
  %inc10 = add i64 %12, 1, !dbg !91
  store i64 %inc10, i64* %i3, align 8, !dbg !91
  br label %for.cond4, !dbg !92, !llvm.loop !93

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !95
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !95
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31_good() #0 !dbg !98 {
entry:
  call void @goodG2B(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* null) #5, !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 %conv) #5, !dbg !113
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31_good(), !dbg !115
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31_bad(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !121 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !130, metadata !DIExpression()), !dbg !132
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !134, metadata !DIExpression()), !dbg !135
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !136
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !146
  %cmp = icmp ult i64 %2, 100, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !152
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !153
  store i32 0, i32* %intOne, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !156
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !157
  store i32 0, i32* %intTwo, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %5, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i3, align 8, !dbg !167
  br label %for.cond4, !dbg !169

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !170
  %cmp5 = icmp ult i64 %6, 100, !dbg !172
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !173

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !174
  %8 = load i64, i64* %i3, align 8, !dbg !176
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !174
  %9 = load i64, i64* %i3, align 8, !dbg !177
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !178
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !178
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !178
  br label %for.inc9, !dbg !179

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !180
  %inc10 = add i64 %12, 1, !dbg !180
  store i64 %inc10, i64* %i3, align 8, !dbg !180
  br label %for.cond4, !dbg !181, !llvm.loop !182

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !184
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !184
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx12), !dbg !185
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 23, column: 21, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 24, column: 19, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 25, column: 19, scope: !11)
!35 = !DILocation(line: 28, column: 12, scope: !11)
!36 = !DILocation(line: 28, column: 10, scope: !11)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !12, line: 30, type: !16)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!39 = !DILocation(line: 30, column: 25, scope: !38)
!40 = !DILocation(line: 30, column: 36, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !12, line: 31, type: !16)
!42 = !DILocation(line: 31, column: 25, scope: !38)
!43 = !DILocation(line: 31, column: 32, scope: !38)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 33, type: !31)
!45 = distinct !DILexicalBlock(scope: !38, file: !12, line: 32, column: 9)
!46 = !DILocation(line: 33, column: 27, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 35, type: !49)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 34, column: 13)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 46, baseType: !51)
!50 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 35, column: 24, scope: !48)
!53 = !DILocation(line: 37, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !48, file: !12, line: 37, column: 17)
!55 = !DILocation(line: 37, column: 22, scope: !54)
!56 = !DILocation(line: 37, column: 29, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !12, line: 37, column: 17)
!58 = !DILocation(line: 37, column: 31, scope: !57)
!59 = !DILocation(line: 37, column: 17, scope: !54)
!60 = !DILocation(line: 39, column: 28, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !12, line: 38, column: 17)
!62 = !DILocation(line: 39, column: 21, scope: !61)
!63 = !DILocation(line: 39, column: 31, scope: !61)
!64 = !DILocation(line: 39, column: 38, scope: !61)
!65 = !DILocation(line: 40, column: 28, scope: !61)
!66 = !DILocation(line: 40, column: 21, scope: !61)
!67 = !DILocation(line: 40, column: 31, scope: !61)
!68 = !DILocation(line: 40, column: 38, scope: !61)
!69 = !DILocation(line: 41, column: 17, scope: !61)
!70 = !DILocation(line: 37, column: 39, scope: !57)
!71 = !DILocation(line: 37, column: 17, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 41, column: 17, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocalVariable(name: "i", scope: !76, file: !12, line: 44, type: !49)
!76 = distinct !DILexicalBlock(scope: !45, file: !12, line: 43, column: 13)
!77 = !DILocation(line: 44, column: 24, scope: !76)
!78 = !DILocation(line: 46, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !12, line: 46, column: 17)
!80 = !DILocation(line: 46, column: 22, scope: !79)
!81 = !DILocation(line: 46, column: 29, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !12, line: 46, column: 17)
!83 = !DILocation(line: 46, column: 31, scope: !82)
!84 = !DILocation(line: 46, column: 17, scope: !79)
!85 = !DILocation(line: 48, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !12, line: 47, column: 17)
!87 = !DILocation(line: 48, column: 26, scope: !86)
!88 = !DILocation(line: 48, column: 38, scope: !86)
!89 = !DILocation(line: 48, column: 31, scope: !86)
!90 = !DILocation(line: 49, column: 17, scope: !86)
!91 = !DILocation(line: 46, column: 39, scope: !82)
!92 = !DILocation(line: 46, column: 17, scope: !82)
!93 = distinct !{!93, !84, !94, !74}
!94 = !DILocation(line: 49, column: 17, scope: !79)
!95 = !DILocation(line: 50, column: 34, scope: !76)
!96 = !DILocation(line: 50, column: 17, scope: !76)
!97 = !DILocation(line: 54, column: 1, scope: !11)
!98 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_31_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocation(line: 97, column: 5, scope: !98)
!100 = !DILocation(line: 98, column: 1, scope: !98)
!101 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !102, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DISubroutineType(types: !103)
!103 = !{!22, !22, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !12, line: 109, type: !22)
!108 = !DILocation(line: 109, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !12, line: 109, type: !104)
!110 = !DILocation(line: 109, column: 27, scope: !101)
!111 = !DILocation(line: 112, column: 22, scope: !101)
!112 = !DILocation(line: 112, column: 12, scope: !101)
!113 = !DILocation(line: 112, column: 5, scope: !101)
!114 = !DILocation(line: 114, column: 5, scope: !101)
!115 = !DILocation(line: 115, column: 5, scope: !101)
!116 = !DILocation(line: 116, column: 5, scope: !101)
!117 = !DILocation(line: 119, column: 5, scope: !101)
!118 = !DILocation(line: 120, column: 5, scope: !101)
!119 = !DILocation(line: 121, column: 5, scope: !101)
!120 = !DILocation(line: 123, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 63, type: !16)
!123 = !DILocation(line: 63, column: 21, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !12, line: 64, type: !26)
!125 = !DILocation(line: 64, column: 19, scope: !121)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !12, line: 65, type: !31)
!127 = !DILocation(line: 65, column: 19, scope: !121)
!128 = !DILocation(line: 67, column: 12, scope: !121)
!129 = !DILocation(line: 67, column: 10, scope: !121)
!130 = !DILocalVariable(name: "dataCopy", scope: !131, file: !12, line: 69, type: !16)
!131 = distinct !DILexicalBlock(scope: !121, file: !12, line: 68, column: 5)
!132 = !DILocation(line: 69, column: 25, scope: !131)
!133 = !DILocation(line: 69, column: 36, scope: !131)
!134 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 70, type: !16)
!135 = !DILocation(line: 70, column: 25, scope: !131)
!136 = !DILocation(line: 70, column: 32, scope: !131)
!137 = !DILocalVariable(name: "source", scope: !138, file: !12, line: 72, type: !31)
!138 = distinct !DILexicalBlock(scope: !131, file: !12, line: 71, column: 9)
!139 = !DILocation(line: 72, column: 27, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 74, type: !49)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 73, column: 13)
!142 = !DILocation(line: 74, column: 24, scope: !141)
!143 = !DILocation(line: 76, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !12, line: 76, column: 17)
!145 = !DILocation(line: 76, column: 22, scope: !144)
!146 = !DILocation(line: 76, column: 29, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 76, column: 17)
!148 = !DILocation(line: 76, column: 31, scope: !147)
!149 = !DILocation(line: 76, column: 17, scope: !144)
!150 = !DILocation(line: 78, column: 28, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 77, column: 17)
!152 = !DILocation(line: 78, column: 21, scope: !151)
!153 = !DILocation(line: 78, column: 31, scope: !151)
!154 = !DILocation(line: 78, column: 38, scope: !151)
!155 = !DILocation(line: 79, column: 28, scope: !151)
!156 = !DILocation(line: 79, column: 21, scope: !151)
!157 = !DILocation(line: 79, column: 31, scope: !151)
!158 = !DILocation(line: 79, column: 38, scope: !151)
!159 = !DILocation(line: 80, column: 17, scope: !151)
!160 = !DILocation(line: 76, column: 39, scope: !147)
!161 = !DILocation(line: 76, column: 17, scope: !147)
!162 = distinct !{!162, !149, !163, !74}
!163 = !DILocation(line: 80, column: 17, scope: !144)
!164 = !DILocalVariable(name: "i", scope: !165, file: !12, line: 83, type: !49)
!165 = distinct !DILexicalBlock(scope: !138, file: !12, line: 82, column: 13)
!166 = !DILocation(line: 83, column: 24, scope: !165)
!167 = !DILocation(line: 85, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 85, column: 17)
!169 = !DILocation(line: 85, column: 22, scope: !168)
!170 = !DILocation(line: 85, column: 29, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 85, column: 17)
!172 = !DILocation(line: 85, column: 31, scope: !171)
!173 = !DILocation(line: 85, column: 17, scope: !168)
!174 = !DILocation(line: 87, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !12, line: 86, column: 17)
!176 = !DILocation(line: 87, column: 26, scope: !175)
!177 = !DILocation(line: 87, column: 38, scope: !175)
!178 = !DILocation(line: 87, column: 31, scope: !175)
!179 = !DILocation(line: 88, column: 17, scope: !175)
!180 = !DILocation(line: 85, column: 39, scope: !171)
!181 = !DILocation(line: 85, column: 17, scope: !171)
!182 = distinct !{!182, !173, !183, !74}
!183 = !DILocation(line: 88, column: 17, scope: !168)
!184 = !DILocation(line: 89, column: 34, scope: !165)
!185 = !DILocation(line: 89, column: 17, scope: !165)
!186 = !DILocation(line: 93, column: 1, scope: !121)
