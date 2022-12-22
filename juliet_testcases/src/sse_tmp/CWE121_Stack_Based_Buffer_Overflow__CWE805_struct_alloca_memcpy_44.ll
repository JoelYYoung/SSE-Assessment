; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (%struct._twoIntsStruct*)* @badSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = alloca i8, i64 400, align 16, !dbg !32
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = alloca i8, i64 800, align 16, !dbg !36
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !37
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !35
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !38
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !39
  %5 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !40
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  call void %5(%struct._twoIntsStruct* %6), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(%struct._twoIntsStruct* %data) #0 !dbg !43 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !61
  %cmp = icmp ult i64 %0, 100, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !67
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !68
  store i32 0, i32* %intOne, align 8, !dbg !69
  %2 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !72
  store i32 0, i32* %intTwo, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %3, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !80
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !81
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !81
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !81
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !81
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !82
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !82
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44_good() #0 !dbg !85 {
entry:
  call void @goodG2B(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* null) #5, !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 %conv) #5, !dbg !100
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44_good(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44_bad(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !108 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %funcPtr = alloca void (%struct._twoIntsStruct*)*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata void (%struct._twoIntsStruct*)** %funcPtr, metadata !111, metadata !DIExpression()), !dbg !112
  store void (%struct._twoIntsStruct*)* @goodG2BSink, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !116
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = alloca i8, i64 800, align 16, !dbg !119
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !120
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !118
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !121
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %5 = load void (%struct._twoIntsStruct*)*, void (%struct._twoIntsStruct*)** %funcPtr, align 8, !dbg !123
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !124
  call void %5(%struct._twoIntsStruct* %6), !dbg !123
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(%struct._twoIntsStruct* %data) #0 !dbg !126 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %entry
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
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !156
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !157
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !157
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !157
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %5, i8* align 16 %6, i64 800, i1 false), !dbg !157
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !158
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 0, !dbg !158
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44_bad", scope: !20, file: !20, line: 40, type: !21, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 42, type: !4)
!24 = !DILocation(line: 42, column: 21, scope: !19)
!25 = !DILocalVariable(name: "funcPtr", scope: !19, file: !20, line: 44, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !4}
!29 = !DILocation(line: 44, column: 12, scope: !19)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 45, type: !4)
!31 = !DILocation(line: 45, column: 21, scope: !19)
!32 = !DILocation(line: 45, column: 54, scope: !19)
!33 = !DILocation(line: 45, column: 37, scope: !19)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 46, type: !4)
!35 = !DILocation(line: 46, column: 21, scope: !19)
!36 = !DILocation(line: 46, column: 55, scope: !19)
!37 = !DILocation(line: 46, column: 38, scope: !19)
!38 = !DILocation(line: 49, column: 12, scope: !19)
!39 = !DILocation(line: 49, column: 10, scope: !19)
!40 = !DILocation(line: 51, column: 5, scope: !19)
!41 = !DILocation(line: 51, column: 13, scope: !19)
!42 = !DILocation(line: 52, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "badSink", scope: !20, file: !20, line: 21, type: !27, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !20, line: 21, type: !4)
!45 = !DILocation(line: 21, column: 37, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !20, line: 24, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !20, line: 23, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 24, column: 23, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !53, file: !20, line: 26, type: !54)
!53 = distinct !DILexicalBlock(scope: !47, file: !20, line: 25, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 46, baseType: !56)
!55 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!56 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 26, column: 20, scope: !53)
!58 = !DILocation(line: 28, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !20, line: 28, column: 13)
!60 = !DILocation(line: 28, column: 18, scope: !59)
!61 = !DILocation(line: 28, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !20, line: 28, column: 13)
!63 = !DILocation(line: 28, column: 27, scope: !62)
!64 = !DILocation(line: 28, column: 13, scope: !59)
!65 = !DILocation(line: 30, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !20, line: 29, column: 13)
!67 = !DILocation(line: 30, column: 17, scope: !66)
!68 = !DILocation(line: 30, column: 27, scope: !66)
!69 = !DILocation(line: 30, column: 34, scope: !66)
!70 = !DILocation(line: 31, column: 24, scope: !66)
!71 = !DILocation(line: 31, column: 17, scope: !66)
!72 = !DILocation(line: 31, column: 27, scope: !66)
!73 = !DILocation(line: 31, column: 34, scope: !66)
!74 = !DILocation(line: 32, column: 13, scope: !66)
!75 = !DILocation(line: 28, column: 35, scope: !62)
!76 = !DILocation(line: 28, column: 13, scope: !62)
!77 = distinct !{!77, !64, !78, !79}
!78 = !DILocation(line: 32, column: 13, scope: !59)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 35, column: 16, scope: !47)
!81 = !DILocation(line: 35, column: 9, scope: !47)
!82 = !DILocation(line: 36, column: 26, scope: !47)
!83 = !DILocation(line: 36, column: 9, scope: !47)
!84 = !DILocation(line: 38, column: 1, scope: !43)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_44_good", scope: !20, file: !20, line: 89, type: !21, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 91, column: 5, scope: !85)
!87 = !DILocation(line: 92, column: 1, scope: !85)
!88 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 103, type: !89, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!10, !10, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !20, line: 103, type: !10)
!95 = !DILocation(line: 103, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !20, line: 103, type: !91)
!97 = !DILocation(line: 103, column: 27, scope: !88)
!98 = !DILocation(line: 106, column: 22, scope: !88)
!99 = !DILocation(line: 106, column: 12, scope: !88)
!100 = !DILocation(line: 106, column: 5, scope: !88)
!101 = !DILocation(line: 108, column: 5, scope: !88)
!102 = !DILocation(line: 109, column: 5, scope: !88)
!103 = !DILocation(line: 110, column: 5, scope: !88)
!104 = !DILocation(line: 113, column: 5, scope: !88)
!105 = !DILocation(line: 114, column: 5, scope: !88)
!106 = !DILocation(line: 115, column: 5, scope: !88)
!107 = !DILocation(line: 117, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 78, type: !21, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!109 = !DILocalVariable(name: "data", scope: !108, file: !20, line: 80, type: !4)
!110 = !DILocation(line: 80, column: 21, scope: !108)
!111 = !DILocalVariable(name: "funcPtr", scope: !108, file: !20, line: 81, type: !26)
!112 = !DILocation(line: 81, column: 12, scope: !108)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !20, line: 82, type: !4)
!114 = !DILocation(line: 82, column: 21, scope: !108)
!115 = !DILocation(line: 82, column: 54, scope: !108)
!116 = !DILocation(line: 82, column: 37, scope: !108)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !20, line: 83, type: !4)
!118 = !DILocation(line: 83, column: 21, scope: !108)
!119 = !DILocation(line: 83, column: 55, scope: !108)
!120 = !DILocation(line: 83, column: 38, scope: !108)
!121 = !DILocation(line: 85, column: 12, scope: !108)
!122 = !DILocation(line: 85, column: 10, scope: !108)
!123 = !DILocation(line: 86, column: 5, scope: !108)
!124 = !DILocation(line: 86, column: 13, scope: !108)
!125 = !DILocation(line: 87, column: 1, scope: !108)
!126 = distinct !DISubprogram(name: "goodG2BSink", scope: !20, file: !20, line: 59, type: !27, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !20, line: 59, type: !4)
!128 = !DILocation(line: 59, column: 41, scope: !126)
!129 = !DILocalVariable(name: "source", scope: !130, file: !20, line: 62, type: !48)
!130 = distinct !DILexicalBlock(scope: !126, file: !20, line: 61, column: 5)
!131 = !DILocation(line: 62, column: 23, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !20, line: 64, type: !54)
!133 = distinct !DILexicalBlock(scope: !130, file: !20, line: 63, column: 9)
!134 = !DILocation(line: 64, column: 20, scope: !133)
!135 = !DILocation(line: 66, column: 20, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !20, line: 66, column: 13)
!137 = !DILocation(line: 66, column: 18, scope: !136)
!138 = !DILocation(line: 66, column: 25, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !20, line: 66, column: 13)
!140 = !DILocation(line: 66, column: 27, scope: !139)
!141 = !DILocation(line: 66, column: 13, scope: !136)
!142 = !DILocation(line: 68, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !20, line: 67, column: 13)
!144 = !DILocation(line: 68, column: 17, scope: !143)
!145 = !DILocation(line: 68, column: 27, scope: !143)
!146 = !DILocation(line: 68, column: 34, scope: !143)
!147 = !DILocation(line: 69, column: 24, scope: !143)
!148 = !DILocation(line: 69, column: 17, scope: !143)
!149 = !DILocation(line: 69, column: 27, scope: !143)
!150 = !DILocation(line: 69, column: 34, scope: !143)
!151 = !DILocation(line: 70, column: 13, scope: !143)
!152 = !DILocation(line: 66, column: 35, scope: !139)
!153 = !DILocation(line: 66, column: 13, scope: !139)
!154 = distinct !{!154, !141, !155, !79}
!155 = !DILocation(line: 70, column: 13, scope: !136)
!156 = !DILocation(line: 73, column: 16, scope: !130)
!157 = !DILocation(line: 73, column: 9, scope: !130)
!158 = !DILocation(line: 74, column: 26, scope: !130)
!159 = !DILocation(line: 74, column: 9, scope: !130)
!160 = !DILocation(line: 76, column: 1, scope: !126)
