; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  br label %while.body, !dbg !35

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !38
  br label %while.end, !dbg !39

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %0, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 0, i32* %intOne, align 8, !dbg !60
  %2 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 0, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %3, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !71, metadata !DIExpression()), !dbg !73
  store i64 0, i64* %i2, align 8, !dbg !74
  br label %for.cond3, !dbg !76

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !77
  %cmp4 = icmp ult i64 %4, 100, !dbg !79
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !80

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %6 = load i64, i64* %i2, align 8, !dbg !83
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !81
  %7 = load i64, i64* %i2, align 8, !dbg !84
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !85
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !85
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !85
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !85
  br label %for.inc8, !dbg !86

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !87
  %inc9 = add i64 %10, 1, !dbg !87
  store i64 %inc9, i64* %i2, align 8, !dbg !87
  br label %for.cond3, !dbg !88, !llvm.loop !89

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !91
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !91
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* null) #5, !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 %conv) #5, !dbg !109
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16_good(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16_bad(), !dbg !114
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  br label %while.body, !dbg !124

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !125
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !127
  br label %while.end, !dbg !128

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !138
  %cmp = icmp ult i64 %0, 100, !dbg !140
  br i1 %cmp, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !144
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !145
  store i32 0, i32* %intOne, align 8, !dbg !146
  %2 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !148
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !149
  store i32 0, i32* %intTwo, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %3, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !156, metadata !DIExpression()), !dbg !158
  store i64 0, i64* %i2, align 8, !dbg !159
  br label %for.cond3, !dbg !161

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !162
  %cmp4 = icmp ult i64 %4, 100, !dbg !164
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !165

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !166
  %6 = load i64, i64* %i2, align 8, !dbg !168
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !166
  %7 = load i64, i64* %i2, align 8, !dbg !169
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !170
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !170
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !170
  br label %for.inc8, !dbg !171

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !172
  %inc9 = add i64 %10, 1, !dbg !172
  store i64 %inc9, i64* %i2, align 8, !dbg !172
  br label %for.cond3, !dbg !173, !llvm.loop !174

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !176
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx11), !dbg !177
  ret void, !dbg !178
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!35 = !DILocation(line: 26, column: 5, scope: !11)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 9, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 34, type: !31)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!42 = !DILocation(line: 34, column: 23, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 36, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 35, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 46, baseType: !47)
!46 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!47 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 36, column: 20, scope: !44)
!49 = !DILocation(line: 38, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !12, line: 38, column: 13)
!51 = !DILocation(line: 38, column: 18, scope: !50)
!52 = !DILocation(line: 38, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 38, column: 13)
!54 = !DILocation(line: 38, column: 27, scope: !53)
!55 = !DILocation(line: 38, column: 13, scope: !50)
!56 = !DILocation(line: 40, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 39, column: 13)
!58 = !DILocation(line: 40, column: 17, scope: !57)
!59 = !DILocation(line: 40, column: 27, scope: !57)
!60 = !DILocation(line: 40, column: 34, scope: !57)
!61 = !DILocation(line: 41, column: 24, scope: !57)
!62 = !DILocation(line: 41, column: 17, scope: !57)
!63 = !DILocation(line: 41, column: 27, scope: !57)
!64 = !DILocation(line: 41, column: 34, scope: !57)
!65 = !DILocation(line: 42, column: 13, scope: !57)
!66 = !DILocation(line: 38, column: 35, scope: !53)
!67 = !DILocation(line: 38, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 42, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocalVariable(name: "i", scope: !72, file: !12, line: 45, type: !45)
!72 = distinct !DILexicalBlock(scope: !41, file: !12, line: 44, column: 9)
!73 = !DILocation(line: 45, column: 20, scope: !72)
!74 = !DILocation(line: 47, column: 20, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !12, line: 47, column: 13)
!76 = !DILocation(line: 47, column: 18, scope: !75)
!77 = !DILocation(line: 47, column: 25, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !12, line: 47, column: 13)
!79 = !DILocation(line: 47, column: 27, scope: !78)
!80 = !DILocation(line: 47, column: 13, scope: !75)
!81 = !DILocation(line: 49, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 48, column: 13)
!83 = !DILocation(line: 49, column: 22, scope: !82)
!84 = !DILocation(line: 49, column: 34, scope: !82)
!85 = !DILocation(line: 49, column: 27, scope: !82)
!86 = !DILocation(line: 50, column: 13, scope: !82)
!87 = !DILocation(line: 47, column: 35, scope: !78)
!88 = !DILocation(line: 47, column: 13, scope: !78)
!89 = distinct !{!89, !80, !90, !70}
!90 = !DILocation(line: 50, column: 13, scope: !75)
!91 = !DILocation(line: 51, column: 30, scope: !72)
!92 = !DILocation(line: 51, column: 13, scope: !72)
!93 = !DILocation(line: 54, column: 1, scope: !11)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_16_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 97, column: 5, scope: !94)
!96 = !DILocation(line: 98, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !98, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!22, !22, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !12, line: 110, type: !22)
!104 = !DILocation(line: 110, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !12, line: 110, type: !100)
!106 = !DILocation(line: 110, column: 27, scope: !97)
!107 = !DILocation(line: 113, column: 22, scope: !97)
!108 = !DILocation(line: 113, column: 12, scope: !97)
!109 = !DILocation(line: 113, column: 5, scope: !97)
!110 = !DILocation(line: 115, column: 5, scope: !97)
!111 = !DILocation(line: 116, column: 5, scope: !97)
!112 = !DILocation(line: 117, column: 5, scope: !97)
!113 = !DILocation(line: 120, column: 5, scope: !97)
!114 = !DILocation(line: 121, column: 5, scope: !97)
!115 = !DILocation(line: 122, column: 5, scope: !97)
!116 = !DILocation(line: 124, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 63, type: !16)
!119 = !DILocation(line: 63, column: 21, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !12, line: 64, type: !26)
!121 = !DILocation(line: 64, column: 19, scope: !117)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !12, line: 65, type: !31)
!123 = !DILocation(line: 65, column: 19, scope: !117)
!124 = !DILocation(line: 66, column: 5, scope: !117)
!125 = !DILocation(line: 69, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !117, file: !12, line: 67, column: 5)
!127 = !DILocation(line: 69, column: 14, scope: !126)
!128 = !DILocation(line: 70, column: 9, scope: !126)
!129 = !DILocalVariable(name: "source", scope: !130, file: !12, line: 73, type: !31)
!130 = distinct !DILexicalBlock(scope: !117, file: !12, line: 72, column: 5)
!131 = !DILocation(line: 73, column: 23, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 75, type: !45)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 74, column: 9)
!134 = !DILocation(line: 75, column: 20, scope: !133)
!135 = !DILocation(line: 77, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 77, column: 13)
!137 = !DILocation(line: 77, column: 18, scope: !136)
!138 = !DILocation(line: 77, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 77, column: 13)
!140 = !DILocation(line: 77, column: 27, scope: !139)
!141 = !DILocation(line: 77, column: 13, scope: !136)
!142 = !DILocation(line: 79, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 78, column: 13)
!144 = !DILocation(line: 79, column: 17, scope: !143)
!145 = !DILocation(line: 79, column: 27, scope: !143)
!146 = !DILocation(line: 79, column: 34, scope: !143)
!147 = !DILocation(line: 80, column: 24, scope: !143)
!148 = !DILocation(line: 80, column: 17, scope: !143)
!149 = !DILocation(line: 80, column: 27, scope: !143)
!150 = !DILocation(line: 80, column: 34, scope: !143)
!151 = !DILocation(line: 81, column: 13, scope: !143)
!152 = !DILocation(line: 77, column: 35, scope: !139)
!153 = !DILocation(line: 77, column: 13, scope: !139)
!154 = distinct !{!154, !141, !155, !70}
!155 = !DILocation(line: 81, column: 13, scope: !136)
!156 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 84, type: !45)
!157 = distinct !DILexicalBlock(scope: !130, file: !12, line: 83, column: 9)
!158 = !DILocation(line: 84, column: 20, scope: !157)
!159 = !DILocation(line: 86, column: 20, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 86, column: 13)
!161 = !DILocation(line: 86, column: 18, scope: !160)
!162 = !DILocation(line: 86, column: 25, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 86, column: 13)
!164 = !DILocation(line: 86, column: 27, scope: !163)
!165 = !DILocation(line: 86, column: 13, scope: !160)
!166 = !DILocation(line: 88, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !12, line: 87, column: 13)
!168 = !DILocation(line: 88, column: 22, scope: !167)
!169 = !DILocation(line: 88, column: 34, scope: !167)
!170 = !DILocation(line: 88, column: 27, scope: !167)
!171 = !DILocation(line: 89, column: 13, scope: !167)
!172 = !DILocation(line: 86, column: 35, scope: !163)
!173 = !DILocation(line: 86, column: 13, scope: !163)
!174 = distinct !{!174, !165, !175, !70}
!175 = !DILocation(line: 89, column: 13, scope: !160)
!176 = !DILocation(line: 90, column: 30, scope: !157)
!177 = !DILocation(line: 90, column: 13, scope: !157)
!178 = !DILocation(line: 93, column: 1, scope: !117)
