; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !15, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType* %myUnion, metadata !25, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !37, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !45
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !47, metadata !DIExpression()), !dbg !49
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !50
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !50
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %2, 100, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !69
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !70
  store i32 0, i32* %intOne, align 8, !dbg !71
  %4 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !73
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !74
  store i32 0, i32* %intTwo, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %5, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !82
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !83
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !83
  %8 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !83
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !83
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !84
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !84
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* null) #5, !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 %conv) #5, !dbg !102
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_good(), !dbg !104
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_bad(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType* %myUnion, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !120
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !122
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !127
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !127
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %2, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !143
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !144
  store i32 0, i32* %intOne, align 8, !dbg !145
  %4 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !147
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !148
  store i32 0, i32* %intTwo, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %5, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !155
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !156
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !156
  %8 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !156
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %7, i8* align 16 %8, i64 800, i1 false), !dbg !156
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !157
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 0, !dbg !157
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx4), !dbg !158
  ret void, !dbg !159
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !18, line: 100, baseType: !19)
!18 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !18, line: 96, size: 64, elements: !20)
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !19, file: !18, line: 98, baseType: !22, size: 32)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !19, file: !18, line: 99, baseType: !22, size: 32, offset: 32)
!24 = !DILocation(line: 29, column: 21, scope: !11)
!25 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_unionType", file: !12, line: 23, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !27, file: !12, line: 21, baseType: !16, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !27, file: !12, line: 22, baseType: !16, size: 64)
!31 = !DILocation(line: 30, column: 84, scope: !11)
!32 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 31, column: 19, scope: !11)
!37 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 32, column: 19, scope: !11)
!42 = !DILocation(line: 35, column: 12, scope: !11)
!43 = !DILocation(line: 35, column: 10, scope: !11)
!44 = !DILocation(line: 36, column: 26, scope: !11)
!45 = !DILocation(line: 36, column: 13, scope: !11)
!46 = !DILocation(line: 36, column: 24, scope: !11)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 38, type: !16)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 25, scope: !48)
!50 = !DILocation(line: 38, column: 40, scope: !48)
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 40, type: !38)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 39, column: 9)
!53 = !DILocation(line: 40, column: 27, scope: !52)
!54 = !DILocalVariable(name: "i", scope: !55, file: !12, line: 42, type: !56)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 41, column: 13)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 46, baseType: !58)
!57 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 42, column: 24, scope: !55)
!60 = !DILocation(line: 44, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !12, line: 44, column: 17)
!62 = !DILocation(line: 44, column: 22, scope: !61)
!63 = !DILocation(line: 44, column: 29, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 44, column: 17)
!65 = !DILocation(line: 44, column: 31, scope: !64)
!66 = !DILocation(line: 44, column: 17, scope: !61)
!67 = !DILocation(line: 46, column: 28, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !12, line: 45, column: 17)
!69 = !DILocation(line: 46, column: 21, scope: !68)
!70 = !DILocation(line: 46, column: 31, scope: !68)
!71 = !DILocation(line: 46, column: 38, scope: !68)
!72 = !DILocation(line: 47, column: 28, scope: !68)
!73 = !DILocation(line: 47, column: 21, scope: !68)
!74 = !DILocation(line: 47, column: 31, scope: !68)
!75 = !DILocation(line: 47, column: 38, scope: !68)
!76 = !DILocation(line: 48, column: 17, scope: !68)
!77 = !DILocation(line: 44, column: 39, scope: !64)
!78 = !DILocation(line: 44, column: 17, scope: !64)
!79 = distinct !{!79, !66, !80, !81}
!80 = !DILocation(line: 48, column: 17, scope: !61)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 51, column: 21, scope: !52)
!83 = !DILocation(line: 51, column: 13, scope: !52)
!84 = !DILocation(line: 52, column: 30, scope: !52)
!85 = !DILocation(line: 52, column: 13, scope: !52)
!86 = !DILocation(line: 55, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_34_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocation(line: 93, column: 5, scope: !87)
!89 = !DILocation(line: 94, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !91, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DISubroutineType(types: !92)
!92 = !{!22, !22, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !12, line: 105, type: !22)
!97 = !DILocation(line: 105, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !12, line: 105, type: !93)
!99 = !DILocation(line: 105, column: 27, scope: !90)
!100 = !DILocation(line: 108, column: 22, scope: !90)
!101 = !DILocation(line: 108, column: 12, scope: !90)
!102 = !DILocation(line: 108, column: 5, scope: !90)
!103 = !DILocation(line: 110, column: 5, scope: !90)
!104 = !DILocation(line: 111, column: 5, scope: !90)
!105 = !DILocation(line: 112, column: 5, scope: !90)
!106 = !DILocation(line: 115, column: 5, scope: !90)
!107 = !DILocation(line: 116, column: 5, scope: !90)
!108 = !DILocation(line: 117, column: 5, scope: !90)
!109 = !DILocation(line: 119, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 62, type: !13, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 64, type: !16)
!112 = !DILocation(line: 64, column: 21, scope: !110)
!113 = !DILocalVariable(name: "myUnion", scope: !110, file: !12, line: 65, type: !26)
!114 = !DILocation(line: 65, column: 84, scope: !110)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 66, type: !33)
!116 = !DILocation(line: 66, column: 19, scope: !110)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 67, type: !38)
!118 = !DILocation(line: 67, column: 19, scope: !110)
!119 = !DILocation(line: 69, column: 12, scope: !110)
!120 = !DILocation(line: 69, column: 10, scope: !110)
!121 = !DILocation(line: 70, column: 26, scope: !110)
!122 = !DILocation(line: 70, column: 13, scope: !110)
!123 = !DILocation(line: 70, column: 24, scope: !110)
!124 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 72, type: !16)
!125 = distinct !DILexicalBlock(scope: !110, file: !12, line: 71, column: 5)
!126 = !DILocation(line: 72, column: 25, scope: !125)
!127 = !DILocation(line: 72, column: 40, scope: !125)
!128 = !DILocalVariable(name: "source", scope: !129, file: !12, line: 74, type: !38)
!129 = distinct !DILexicalBlock(scope: !125, file: !12, line: 73, column: 9)
!130 = !DILocation(line: 74, column: 27, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !132, file: !12, line: 76, type: !56)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 75, column: 13)
!133 = !DILocation(line: 76, column: 24, scope: !132)
!134 = !DILocation(line: 78, column: 24, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 78, column: 17)
!136 = !DILocation(line: 78, column: 22, scope: !135)
!137 = !DILocation(line: 78, column: 29, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 78, column: 17)
!139 = !DILocation(line: 78, column: 31, scope: !138)
!140 = !DILocation(line: 78, column: 17, scope: !135)
!141 = !DILocation(line: 80, column: 28, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !12, line: 79, column: 17)
!143 = !DILocation(line: 80, column: 21, scope: !142)
!144 = !DILocation(line: 80, column: 31, scope: !142)
!145 = !DILocation(line: 80, column: 38, scope: !142)
!146 = !DILocation(line: 81, column: 28, scope: !142)
!147 = !DILocation(line: 81, column: 21, scope: !142)
!148 = !DILocation(line: 81, column: 31, scope: !142)
!149 = !DILocation(line: 81, column: 38, scope: !142)
!150 = !DILocation(line: 82, column: 17, scope: !142)
!151 = !DILocation(line: 78, column: 39, scope: !138)
!152 = !DILocation(line: 78, column: 17, scope: !138)
!153 = distinct !{!153, !140, !154, !81}
!154 = !DILocation(line: 82, column: 17, scope: !135)
!155 = !DILocation(line: 85, column: 21, scope: !129)
!156 = !DILocation(line: 85, column: 13, scope: !129)
!157 = !DILocation(line: 86, column: 30, scope: !129)
!158 = !DILocation(line: 86, column: 13, scope: !129)
!159 = !DILocation(line: 89, column: 1, scope: !110)
