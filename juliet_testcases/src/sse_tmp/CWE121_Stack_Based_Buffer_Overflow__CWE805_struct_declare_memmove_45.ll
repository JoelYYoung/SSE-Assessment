; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_badData, align 8, !dbg !43
  call void @badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_badData, align 8, !dbg !72
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !73, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i64* %i, metadata !76, metadata !DIExpression()), !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %1, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !91
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !92
  store i32 0, i32* %intOne, align 8, !dbg !93
  %3 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !95
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !96
  store i32 0, i32* %intTwo, align 4, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %4, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !104
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !105
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !105
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !106
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !118
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_goodG2BData, align 8, !dbg !119
  call void @goodG2BSink(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !122 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_goodG2BData, align 8, !dbg !125
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %1, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !141
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !142
  store i32 0, i32* %intOne, align 8, !dbg !143
  %3 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !145
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !146
  store i32 0, i32* %intTwo, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %4, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !153
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !154
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !154
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %6, i8* align 16 %7, i64 800, i1 false), !dbg !154
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %8, i64 0, !dbg !155
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_badData", scope: !2, file: !10, line: 19, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_goodG2BData", scope: !2, file: !10, line: 20, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45.c", directory: "/root/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !13, line: 100, baseType: !14)
!13 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/root/SSE-Assessment")
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !13, line: 96, size: 64, elements: !15)
!15 = !{!16, !18}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !14, file: !13, line: 98, baseType: !17, size: 32)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !14, file: !13, line: 99, baseType: !17, size: 32, offset: 32)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_bad", scope: !10, file: !10, line: 44, type: !26, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !10, line: 46, type: !11)
!29 = !DILocation(line: 46, column: 21, scope: !25)
!30 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !10, line: 47, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 50)
!34 = !DILocation(line: 47, column: 19, scope: !25)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !10, line: 48, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 48, column: 19, scope: !25)
!40 = !DILocation(line: 51, column: 12, scope: !25)
!41 = !DILocation(line: 51, column: 10, scope: !25)
!42 = !DILocation(line: 52, column: 84, scope: !25)
!43 = !DILocation(line: 52, column: 82, scope: !25)
!44 = !DILocation(line: 53, column: 5, scope: !25)
!45 = !DILocation(line: 54, column: 1, scope: !25)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_45_good", scope: !10, file: !10, line: 92, type: !26, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!47 = !DILocation(line: 94, column: 5, scope: !46)
!48 = !DILocation(line: 95, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 106, type: !50, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!17, !17, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !10, line: 106, type: !17)
!56 = !DILocation(line: 106, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !10, line: 106, type: !52)
!58 = !DILocation(line: 106, column: 27, scope: !49)
!59 = !DILocation(line: 109, column: 22, scope: !49)
!60 = !DILocation(line: 109, column: 12, scope: !49)
!61 = !DILocation(line: 109, column: 5, scope: !49)
!62 = !DILocation(line: 111, column: 5, scope: !49)
!63 = !DILocation(line: 112, column: 5, scope: !49)
!64 = !DILocation(line: 113, column: 5, scope: !49)
!65 = !DILocation(line: 116, column: 5, scope: !49)
!66 = !DILocation(line: 117, column: 5, scope: !49)
!67 = !DILocation(line: 118, column: 5, scope: !49)
!68 = !DILocation(line: 120, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 24, type: !26, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DILocalVariable(name: "data", scope: !69, file: !10, line: 26, type: !11)
!71 = !DILocation(line: 26, column: 21, scope: !69)
!72 = !DILocation(line: 26, column: 28, scope: !69)
!73 = !DILocalVariable(name: "source", scope: !74, file: !10, line: 28, type: !36)
!74 = distinct !DILexicalBlock(scope: !69, file: !10, line: 27, column: 5)
!75 = !DILocation(line: 28, column: 23, scope: !74)
!76 = !DILocalVariable(name: "i", scope: !77, file: !10, line: 30, type: !78)
!77 = distinct !DILexicalBlock(scope: !74, file: !10, line: 29, column: 9)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !79, line: 46, baseType: !80)
!79 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!80 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!81 = !DILocation(line: 30, column: 20, scope: !77)
!82 = !DILocation(line: 32, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !10, line: 32, column: 13)
!84 = !DILocation(line: 32, column: 18, scope: !83)
!85 = !DILocation(line: 32, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !10, line: 32, column: 13)
!87 = !DILocation(line: 32, column: 27, scope: !86)
!88 = !DILocation(line: 32, column: 13, scope: !83)
!89 = !DILocation(line: 34, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !10, line: 33, column: 13)
!91 = !DILocation(line: 34, column: 17, scope: !90)
!92 = !DILocation(line: 34, column: 27, scope: !90)
!93 = !DILocation(line: 34, column: 34, scope: !90)
!94 = !DILocation(line: 35, column: 24, scope: !90)
!95 = !DILocation(line: 35, column: 17, scope: !90)
!96 = !DILocation(line: 35, column: 27, scope: !90)
!97 = !DILocation(line: 35, column: 34, scope: !90)
!98 = !DILocation(line: 36, column: 13, scope: !90)
!99 = !DILocation(line: 32, column: 35, scope: !86)
!100 = !DILocation(line: 32, column: 13, scope: !86)
!101 = distinct !{!101, !88, !102, !103}
!102 = !DILocation(line: 36, column: 13, scope: !83)
!103 = !{!"llvm.loop.mustprogress"}
!104 = !DILocation(line: 39, column: 17, scope: !74)
!105 = !DILocation(line: 39, column: 9, scope: !74)
!106 = !DILocation(line: 40, column: 26, scope: !74)
!107 = !DILocation(line: 40, column: 9, scope: !74)
!108 = !DILocation(line: 42, column: 1, scope: !69)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 81, type: !26, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !10, line: 83, type: !11)
!111 = !DILocation(line: 83, column: 21, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !10, line: 84, type: !31)
!113 = !DILocation(line: 84, column: 19, scope: !109)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !10, line: 85, type: !36)
!115 = !DILocation(line: 85, column: 19, scope: !109)
!116 = !DILocation(line: 87, column: 12, scope: !109)
!117 = !DILocation(line: 87, column: 10, scope: !109)
!118 = !DILocation(line: 88, column: 88, scope: !109)
!119 = !DILocation(line: 88, column: 86, scope: !109)
!120 = !DILocation(line: 89, column: 5, scope: !109)
!121 = !DILocation(line: 90, column: 1, scope: !109)
!122 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 61, type: !26, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!123 = !DILocalVariable(name: "data", scope: !122, file: !10, line: 63, type: !11)
!124 = !DILocation(line: 63, column: 21, scope: !122)
!125 = !DILocation(line: 63, column: 28, scope: !122)
!126 = !DILocalVariable(name: "source", scope: !127, file: !10, line: 65, type: !36)
!127 = distinct !DILexicalBlock(scope: !122, file: !10, line: 64, column: 5)
!128 = !DILocation(line: 65, column: 23, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !130, file: !10, line: 67, type: !78)
!130 = distinct !DILexicalBlock(scope: !127, file: !10, line: 66, column: 9)
!131 = !DILocation(line: 67, column: 20, scope: !130)
!132 = !DILocation(line: 69, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !10, line: 69, column: 13)
!134 = !DILocation(line: 69, column: 18, scope: !133)
!135 = !DILocation(line: 69, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !10, line: 69, column: 13)
!137 = !DILocation(line: 69, column: 27, scope: !136)
!138 = !DILocation(line: 69, column: 13, scope: !133)
!139 = !DILocation(line: 71, column: 24, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !10, line: 70, column: 13)
!141 = !DILocation(line: 71, column: 17, scope: !140)
!142 = !DILocation(line: 71, column: 27, scope: !140)
!143 = !DILocation(line: 71, column: 34, scope: !140)
!144 = !DILocation(line: 72, column: 24, scope: !140)
!145 = !DILocation(line: 72, column: 17, scope: !140)
!146 = !DILocation(line: 72, column: 27, scope: !140)
!147 = !DILocation(line: 72, column: 34, scope: !140)
!148 = !DILocation(line: 73, column: 13, scope: !140)
!149 = !DILocation(line: 69, column: 35, scope: !136)
!150 = !DILocation(line: 69, column: 13, scope: !136)
!151 = distinct !{!151, !138, !152, !103}
!152 = !DILocation(line: 73, column: 13, scope: !133)
!153 = !DILocation(line: 76, column: 17, scope: !127)
!154 = !DILocation(line: 76, column: 9, scope: !127)
!155 = !DILocation(line: 77, column: 26, scope: !127)
!156 = !DILocation(line: 77, column: 9, scope: !127)
!157 = !DILocation(line: 79, column: 1, scope: !122)
