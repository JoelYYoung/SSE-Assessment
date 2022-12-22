; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion, metadata !25, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = alloca i8, i64 400, align 16, !dbg !34
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !37
  %2 = alloca i8, i64 800, align 16, !dbg !38
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !39
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !37
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !40
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !43
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !48
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !48
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !64
  %cmp = icmp ult i64 %7, 100, !dbg !66
  br i1 %cmp, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !70
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !71
  store i32 0, i32* %intOne, align 8, !dbg !72
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !74
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !75
  store i32 0, i32* %intTwo, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %10, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !83
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !84
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !84
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !84
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %12, i8* align 16 %13, i64 800, i1 false), !dbg !84
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !85
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !85
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #5, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #5, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 400, align 16, !dbg !118
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !119
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 800, align 16, !dbg !122
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !123
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !121
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !124
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !125
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !126
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !127
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !129, metadata !DIExpression()), !dbg !131
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !132
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !132
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !142
  %cmp = icmp ult i64 %7, 100, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !148
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !149
  store i32 0, i32* %intOne, align 8, !dbg !150
  %9 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !152
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !153
  store i32 0, i32* %intTwo, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %10, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !160
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !161
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !161
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !161
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %12, i8* align 16 %13, i64 800, i1 false), !dbg !161
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !162
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !162
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx3), !dbg !163
  ret void, !dbg !164
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34.c", directory: "/root/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_bad", scope: !20, file: !20, line: 27, type: !21, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34.c", directory: "/root/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 29, type: !4)
!24 = !DILocation(line: 29, column: 21, scope: !19)
!25 = !DILocalVariable(name: "myUnion", scope: !19, file: !20, line: 30, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType", file: !20, line: 23, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !20, line: 19, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !27, file: !20, line: 21, baseType: !4, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !27, file: !20, line: 22, baseType: !4, size: 64)
!31 = !DILocation(line: 30, column: 83, scope: !19)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 31, type: !4)
!33 = !DILocation(line: 31, column: 21, scope: !19)
!34 = !DILocation(line: 31, column: 54, scope: !19)
!35 = !DILocation(line: 31, column: 37, scope: !19)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 32, type: !4)
!37 = !DILocation(line: 32, column: 21, scope: !19)
!38 = !DILocation(line: 32, column: 55, scope: !19)
!39 = !DILocation(line: 32, column: 38, scope: !19)
!40 = !DILocation(line: 35, column: 12, scope: !19)
!41 = !DILocation(line: 35, column: 10, scope: !19)
!42 = !DILocation(line: 36, column: 26, scope: !19)
!43 = !DILocation(line: 36, column: 13, scope: !19)
!44 = !DILocation(line: 36, column: 24, scope: !19)
!45 = !DILocalVariable(name: "data", scope: !46, file: !20, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !19, file: !20, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 25, scope: !46)
!48 = !DILocation(line: 38, column: 40, scope: !46)
!49 = !DILocalVariable(name: "source", scope: !50, file: !20, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !20, line: 39, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 40, column: 27, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !56, file: !20, line: 42, type: !57)
!56 = distinct !DILexicalBlock(scope: !50, file: !20, line: 41, column: 13)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 46, baseType: !59)
!58 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!59 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 42, column: 24, scope: !56)
!61 = !DILocation(line: 44, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !20, line: 44, column: 17)
!63 = !DILocation(line: 44, column: 22, scope: !62)
!64 = !DILocation(line: 44, column: 29, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !20, line: 44, column: 17)
!66 = !DILocation(line: 44, column: 31, scope: !65)
!67 = !DILocation(line: 44, column: 17, scope: !62)
!68 = !DILocation(line: 46, column: 28, scope: !69)
!69 = distinct !DILexicalBlock(scope: !65, file: !20, line: 45, column: 17)
!70 = !DILocation(line: 46, column: 21, scope: !69)
!71 = !DILocation(line: 46, column: 31, scope: !69)
!72 = !DILocation(line: 46, column: 38, scope: !69)
!73 = !DILocation(line: 47, column: 28, scope: !69)
!74 = !DILocation(line: 47, column: 21, scope: !69)
!75 = !DILocation(line: 47, column: 31, scope: !69)
!76 = !DILocation(line: 47, column: 38, scope: !69)
!77 = !DILocation(line: 48, column: 17, scope: !69)
!78 = !DILocation(line: 44, column: 39, scope: !65)
!79 = !DILocation(line: 44, column: 17, scope: !65)
!80 = distinct !{!80, !67, !81, !82}
!81 = !DILocation(line: 48, column: 17, scope: !62)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 51, column: 21, scope: !50)
!84 = !DILocation(line: 51, column: 13, scope: !50)
!85 = !DILocation(line: 52, column: 30, scope: !50)
!86 = !DILocation(line: 52, column: 13, scope: !50)
!87 = !DILocation(line: 55, column: 1, scope: !19)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_good", scope: !20, file: !20, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 93, column: 5, scope: !88)
!90 = !DILocation(line: 94, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 105, type: !92, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!10, !10, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !20, line: 105, type: !10)
!98 = !DILocation(line: 105, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !20, line: 105, type: !94)
!100 = !DILocation(line: 105, column: 27, scope: !91)
!101 = !DILocation(line: 108, column: 22, scope: !91)
!102 = !DILocation(line: 108, column: 12, scope: !91)
!103 = !DILocation(line: 108, column: 5, scope: !91)
!104 = !DILocation(line: 110, column: 5, scope: !91)
!105 = !DILocation(line: 111, column: 5, scope: !91)
!106 = !DILocation(line: 112, column: 5, scope: !91)
!107 = !DILocation(line: 115, column: 5, scope: !91)
!108 = !DILocation(line: 116, column: 5, scope: !91)
!109 = !DILocation(line: 117, column: 5, scope: !91)
!110 = !DILocation(line: 119, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !20, line: 64, type: !4)
!113 = !DILocation(line: 64, column: 21, scope: !111)
!114 = !DILocalVariable(name: "myUnion", scope: !111, file: !20, line: 65, type: !26)
!115 = !DILocation(line: 65, column: 83, scope: !111)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !20, line: 66, type: !4)
!117 = !DILocation(line: 66, column: 21, scope: !111)
!118 = !DILocation(line: 66, column: 54, scope: !111)
!119 = !DILocation(line: 66, column: 37, scope: !111)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !20, line: 67, type: !4)
!121 = !DILocation(line: 67, column: 21, scope: !111)
!122 = !DILocation(line: 67, column: 55, scope: !111)
!123 = !DILocation(line: 67, column: 38, scope: !111)
!124 = !DILocation(line: 69, column: 12, scope: !111)
!125 = !DILocation(line: 69, column: 10, scope: !111)
!126 = !DILocation(line: 70, column: 26, scope: !111)
!127 = !DILocation(line: 70, column: 13, scope: !111)
!128 = !DILocation(line: 70, column: 24, scope: !111)
!129 = !DILocalVariable(name: "data", scope: !130, file: !20, line: 72, type: !4)
!130 = distinct !DILexicalBlock(scope: !111, file: !20, line: 71, column: 5)
!131 = !DILocation(line: 72, column: 25, scope: !130)
!132 = !DILocation(line: 72, column: 40, scope: !130)
!133 = !DILocalVariable(name: "source", scope: !134, file: !20, line: 74, type: !51)
!134 = distinct !DILexicalBlock(scope: !130, file: !20, line: 73, column: 9)
!135 = !DILocation(line: 74, column: 27, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !137, file: !20, line: 76, type: !57)
!137 = distinct !DILexicalBlock(scope: !134, file: !20, line: 75, column: 13)
!138 = !DILocation(line: 76, column: 24, scope: !137)
!139 = !DILocation(line: 78, column: 24, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !20, line: 78, column: 17)
!141 = !DILocation(line: 78, column: 22, scope: !140)
!142 = !DILocation(line: 78, column: 29, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !20, line: 78, column: 17)
!144 = !DILocation(line: 78, column: 31, scope: !143)
!145 = !DILocation(line: 78, column: 17, scope: !140)
!146 = !DILocation(line: 80, column: 28, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !20, line: 79, column: 17)
!148 = !DILocation(line: 80, column: 21, scope: !147)
!149 = !DILocation(line: 80, column: 31, scope: !147)
!150 = !DILocation(line: 80, column: 38, scope: !147)
!151 = !DILocation(line: 81, column: 28, scope: !147)
!152 = !DILocation(line: 81, column: 21, scope: !147)
!153 = !DILocation(line: 81, column: 31, scope: !147)
!154 = !DILocation(line: 81, column: 38, scope: !147)
!155 = !DILocation(line: 82, column: 17, scope: !147)
!156 = !DILocation(line: 78, column: 39, scope: !143)
!157 = !DILocation(line: 78, column: 17, scope: !143)
!158 = distinct !{!158, !145, !159, !82}
!159 = !DILocation(line: 82, column: 17, scope: !140)
!160 = !DILocation(line: 85, column: 21, scope: !134)
!161 = !DILocation(line: 85, column: 13, scope: !134)
!162 = !DILocation(line: 86, column: 30, scope: !134)
!163 = !DILocation(line: 86, column: 13, scope: !134)
!164 = !DILocation(line: 89, column: 1, scope: !111)
