; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_bad() #0 !dbg !19 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !30
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 800, align 16, !dbg !33
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !34
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !32
  store i32 0, i32* %i, align 4, !dbg !35
  br label %for.cond, !dbg !37

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp slt i32 %4, 1, !dbg !40
  br i1 %cmp, label %for.body, label %for.end, !dbg !41

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !42
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %6, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !57, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i1, align 8, !dbg !63
  br label %for.cond2, !dbg !65

for.cond2:                                        ; preds = %for.inc6, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !66
  %cmp3 = icmp ult i64 %7, 100, !dbg !68
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !69

for.body4:                                        ; preds = %for.cond2
  %8 = load i64, i64* %i1, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !72
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !73
  store i32 0, i32* %intOne, align 8, !dbg !74
  %9 = load i64, i64* %i1, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !76
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !77
  store i32 0, i32* %intTwo, align 4, !dbg !78
  br label %for.inc6, !dbg !79

for.inc6:                                         ; preds = %for.body4
  %10 = load i64, i64* %i1, align 8, !dbg !80
  %inc7 = add i64 %10, 1, !dbg !80
  store i64 %inc7, i64* %i1, align 8, !dbg !80
  br label %for.cond2, !dbg !81, !llvm.loop !82

for.end8:                                         ; preds = %for.cond2
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !85
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !85
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %12, i8* align 16 %13, i64 800, i1 false), !dbg !85
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !86
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx9), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_good() #0 !dbg !89 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #5, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #5, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 400, align 16, !dbg !119
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !120
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = alloca i8, i64 800, align 16, !dbg !123
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !124
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !122
  store i32 0, i32* %h, align 4, !dbg !125
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !128
  %cmp = icmp slt i32 %4, 1, !dbg !130
  br i1 %cmp, label %for.body, label %for.end, !dbg !131

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !132
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !136
  %inc = add nsw i32 %6, 1, !dbg !136
  store i32 %inc, i32* %h, align 4, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond1, !dbg !148

for.cond1:                                        ; preds = %for.inc5, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !149
  %cmp2 = icmp ult i64 %7, 100, !dbg !151
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !152

for.body3:                                        ; preds = %for.cond1
  %8 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !155
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !156
  store i32 0, i32* %intOne, align 8, !dbg !157
  %9 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !159
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !160
  store i32 0, i32* %intTwo, align 4, !dbg !161
  br label %for.inc5, !dbg !162

for.inc5:                                         ; preds = %for.body3
  %10 = load i64, i64* %i, align 8, !dbg !163
  %inc6 = add i64 %10, 1, !dbg !163
  store i64 %inc6, i64* %i, align 8, !dbg !163
  br label %for.cond1, !dbg !164, !llvm.loop !165

for.end7:                                         ; preds = %for.cond1
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !167
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !168
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !168
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !168
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %12, i8* align 16 %13, i64 800, i1 false), !dbg !168
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !169
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !169
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx8), !dbg !170
  ret void, !dbg !171
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "i", scope: !19, file: !20, line: 23, type: !10)
!24 = !DILocation(line: 23, column: 9, scope: !19)
!25 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 25, type: !4)
!28 = !DILocation(line: 25, column: 21, scope: !19)
!29 = !DILocation(line: 25, column: 54, scope: !19)
!30 = !DILocation(line: 25, column: 37, scope: !19)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 26, type: !4)
!32 = !DILocation(line: 26, column: 21, scope: !19)
!33 = !DILocation(line: 26, column: 55, scope: !19)
!34 = !DILocation(line: 26, column: 38, scope: !19)
!35 = !DILocation(line: 27, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!37 = !DILocation(line: 27, column: 9, scope: !36)
!38 = !DILocation(line: 27, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !20, line: 27, column: 5)
!40 = !DILocation(line: 27, column: 18, scope: !39)
!41 = !DILocation(line: 27, column: 5, scope: !36)
!42 = !DILocation(line: 31, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !20, line: 28, column: 5)
!44 = !DILocation(line: 31, column: 14, scope: !43)
!45 = !DILocation(line: 32, column: 5, scope: !43)
!46 = !DILocation(line: 27, column: 24, scope: !39)
!47 = !DILocation(line: 27, column: 5, scope: !39)
!48 = distinct !{!48, !41, !49, !50}
!49 = !DILocation(line: 32, column: 5, scope: !36)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !20, line: 34, type: !53)
!52 = distinct !DILexicalBlock(scope: !19, file: !20, line: 33, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 34, column: 23, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !58, file: !20, line: 36, type: !59)
!58 = distinct !DILexicalBlock(scope: !52, file: !20, line: 35, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 46, baseType: !61)
!60 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!61 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 36, column: 20, scope: !58)
!63 = !DILocation(line: 38, column: 20, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !20, line: 38, column: 13)
!65 = !DILocation(line: 38, column: 18, scope: !64)
!66 = !DILocation(line: 38, column: 25, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !20, line: 38, column: 13)
!68 = !DILocation(line: 38, column: 27, scope: !67)
!69 = !DILocation(line: 38, column: 13, scope: !64)
!70 = !DILocation(line: 40, column: 24, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !20, line: 39, column: 13)
!72 = !DILocation(line: 40, column: 17, scope: !71)
!73 = !DILocation(line: 40, column: 27, scope: !71)
!74 = !DILocation(line: 40, column: 34, scope: !71)
!75 = !DILocation(line: 41, column: 24, scope: !71)
!76 = !DILocation(line: 41, column: 17, scope: !71)
!77 = !DILocation(line: 41, column: 27, scope: !71)
!78 = !DILocation(line: 41, column: 34, scope: !71)
!79 = !DILocation(line: 42, column: 13, scope: !71)
!80 = !DILocation(line: 38, column: 35, scope: !67)
!81 = !DILocation(line: 38, column: 13, scope: !67)
!82 = distinct !{!82, !69, !83, !50}
!83 = !DILocation(line: 42, column: 13, scope: !64)
!84 = !DILocation(line: 45, column: 17, scope: !52)
!85 = !DILocation(line: 45, column: 9, scope: !52)
!86 = !DILocation(line: 46, column: 26, scope: !52)
!87 = !DILocation(line: 46, column: 9, scope: !52)
!88 = !DILocation(line: 48, column: 1, scope: !19)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_good", scope: !20, file: !20, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 85, column: 5, scope: !89)
!91 = !DILocation(line: 86, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 98, type: !93, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!10, !10, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !20, line: 98, type: !10)
!99 = !DILocation(line: 98, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !20, line: 98, type: !95)
!101 = !DILocation(line: 98, column: 27, scope: !92)
!102 = !DILocation(line: 101, column: 22, scope: !92)
!103 = !DILocation(line: 101, column: 12, scope: !92)
!104 = !DILocation(line: 101, column: 5, scope: !92)
!105 = !DILocation(line: 103, column: 5, scope: !92)
!106 = !DILocation(line: 104, column: 5, scope: !92)
!107 = !DILocation(line: 105, column: 5, scope: !92)
!108 = !DILocation(line: 108, column: 5, scope: !92)
!109 = !DILocation(line: 109, column: 5, scope: !92)
!110 = !DILocation(line: 110, column: 5, scope: !92)
!111 = !DILocation(line: 112, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "h", scope: !112, file: !20, line: 57, type: !10)
!114 = !DILocation(line: 57, column: 9, scope: !112)
!115 = !DILocalVariable(name: "data", scope: !112, file: !20, line: 58, type: !4)
!116 = !DILocation(line: 58, column: 21, scope: !112)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !20, line: 59, type: !4)
!118 = !DILocation(line: 59, column: 21, scope: !112)
!119 = !DILocation(line: 59, column: 54, scope: !112)
!120 = !DILocation(line: 59, column: 37, scope: !112)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !20, line: 60, type: !4)
!122 = !DILocation(line: 60, column: 21, scope: !112)
!123 = !DILocation(line: 60, column: 55, scope: !112)
!124 = !DILocation(line: 60, column: 38, scope: !112)
!125 = !DILocation(line: 61, column: 11, scope: !126)
!126 = distinct !DILexicalBlock(scope: !112, file: !20, line: 61, column: 5)
!127 = !DILocation(line: 61, column: 9, scope: !126)
!128 = !DILocation(line: 61, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !20, line: 61, column: 5)
!130 = !DILocation(line: 61, column: 18, scope: !129)
!131 = !DILocation(line: 61, column: 5, scope: !126)
!132 = !DILocation(line: 64, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !20, line: 62, column: 5)
!134 = !DILocation(line: 64, column: 14, scope: !133)
!135 = !DILocation(line: 65, column: 5, scope: !133)
!136 = !DILocation(line: 61, column: 24, scope: !129)
!137 = !DILocation(line: 61, column: 5, scope: !129)
!138 = distinct !{!138, !131, !139, !50}
!139 = !DILocation(line: 65, column: 5, scope: !126)
!140 = !DILocalVariable(name: "source", scope: !141, file: !20, line: 67, type: !53)
!141 = distinct !DILexicalBlock(scope: !112, file: !20, line: 66, column: 5)
!142 = !DILocation(line: 67, column: 23, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !20, line: 69, type: !59)
!144 = distinct !DILexicalBlock(scope: !141, file: !20, line: 68, column: 9)
!145 = !DILocation(line: 69, column: 20, scope: !144)
!146 = !DILocation(line: 71, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !20, line: 71, column: 13)
!148 = !DILocation(line: 71, column: 18, scope: !147)
!149 = !DILocation(line: 71, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !20, line: 71, column: 13)
!151 = !DILocation(line: 71, column: 27, scope: !150)
!152 = !DILocation(line: 71, column: 13, scope: !147)
!153 = !DILocation(line: 73, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !20, line: 72, column: 13)
!155 = !DILocation(line: 73, column: 17, scope: !154)
!156 = !DILocation(line: 73, column: 27, scope: !154)
!157 = !DILocation(line: 73, column: 34, scope: !154)
!158 = !DILocation(line: 74, column: 24, scope: !154)
!159 = !DILocation(line: 74, column: 17, scope: !154)
!160 = !DILocation(line: 74, column: 27, scope: !154)
!161 = !DILocation(line: 74, column: 34, scope: !154)
!162 = !DILocation(line: 75, column: 13, scope: !154)
!163 = !DILocation(line: 71, column: 35, scope: !150)
!164 = !DILocation(line: 71, column: 13, scope: !150)
!165 = distinct !{!165, !152, !166, !50}
!166 = !DILocation(line: 75, column: 13, scope: !147)
!167 = !DILocation(line: 78, column: 17, scope: !141)
!168 = !DILocation(line: 78, column: 9, scope: !141)
!169 = !DILocation(line: 79, column: 26, scope: !141)
!170 = !DILocation(line: 79, column: 9, scope: !141)
!171 = !DILocation(line: 81, column: 1, scope: !112)
