; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !28
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !30
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !36
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !40
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %6, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %9, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !78
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !78
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !78
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !78
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printStructLine(%struct._twoIntsStruct*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 400, align 16, !dbg !110
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !111
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 800, align 16, !dbg !114
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !115
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !113
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !119
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !121
  br label %if.end, !dbg !122

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !123
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !135
  %cmp = icmp ult i64 %6, 100, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !141
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !142
  store i32 0, i32* %intOne, align 8, !dbg !143
  %8 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !145
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !146
  store i32 0, i32* %intTwo, align 4, !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !149
  %inc = add i64 %9, 1, !dbg !149
  store i64 %inc, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !153
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !154
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !154
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !154
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 4 %11, i8* align 16 %12, i64 800, i1 false), !dbg !154
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !155
  call void @printStructLine(%struct._twoIntsStruct* %arrayidx2), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !4)
!24 = !DILocation(line: 23, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !4)
!26 = !DILocation(line: 24, column: 21, scope: !19)
!27 = !DILocation(line: 24, column: 54, scope: !19)
!28 = !DILocation(line: 24, column: 37, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !4)
!30 = !DILocation(line: 25, column: 21, scope: !19)
!31 = !DILocation(line: 25, column: 55, scope: !19)
!32 = !DILocation(line: 25, column: 38, scope: !19)
!33 = !DILocation(line: 26, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!35 = !DILocation(line: 26, column: 8, scope: !19)
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !20, line: 27, column: 5)
!38 = !DILocation(line: 30, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 5, scope: !37)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !20, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocalVariable(name: "source", scope: !44, file: !20, line: 38, type: !45)
!44 = distinct !DILexicalBlock(scope: !19, file: !20, line: 37, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 38, column: 23, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !20, line: 40, type: !51)
!50 = distinct !DILexicalBlock(scope: !44, file: !20, line: 39, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 46, baseType: !53)
!52 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!53 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 40, column: 20, scope: !50)
!55 = !DILocation(line: 42, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !20, line: 42, column: 13)
!57 = !DILocation(line: 42, column: 18, scope: !56)
!58 = !DILocation(line: 42, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !20, line: 42, column: 13)
!60 = !DILocation(line: 42, column: 27, scope: !59)
!61 = !DILocation(line: 42, column: 13, scope: !56)
!62 = !DILocation(line: 44, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !20, line: 43, column: 13)
!64 = !DILocation(line: 44, column: 17, scope: !63)
!65 = !DILocation(line: 44, column: 27, scope: !63)
!66 = !DILocation(line: 44, column: 34, scope: !63)
!67 = !DILocation(line: 45, column: 24, scope: !63)
!68 = !DILocation(line: 45, column: 17, scope: !63)
!69 = !DILocation(line: 45, column: 27, scope: !63)
!70 = !DILocation(line: 45, column: 34, scope: !63)
!71 = !DILocation(line: 46, column: 13, scope: !63)
!72 = !DILocation(line: 42, column: 35, scope: !59)
!73 = !DILocation(line: 42, column: 13, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 46, column: 13, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 49, column: 17, scope: !44)
!78 = !DILocation(line: 49, column: 9, scope: !44)
!79 = !DILocation(line: 50, column: 26, scope: !44)
!80 = !DILocation(line: 50, column: 9, scope: !44)
!81 = !DILocation(line: 52, column: 1, scope: !19)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_12_good", scope: !20, file: !20, line: 92, type: !21, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 94, column: 5, scope: !82)
!84 = !DILocation(line: 95, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 107, type: !86, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!10, !10, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !20, line: 107, type: !10)
!92 = !DILocation(line: 107, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !20, line: 107, type: !88)
!94 = !DILocation(line: 107, column: 27, scope: !85)
!95 = !DILocation(line: 110, column: 22, scope: !85)
!96 = !DILocation(line: 110, column: 12, scope: !85)
!97 = !DILocation(line: 110, column: 5, scope: !85)
!98 = !DILocation(line: 112, column: 5, scope: !85)
!99 = !DILocation(line: 113, column: 5, scope: !85)
!100 = !DILocation(line: 114, column: 5, scope: !85)
!101 = !DILocation(line: 117, column: 5, scope: !85)
!102 = !DILocation(line: 118, column: 5, scope: !85)
!103 = !DILocation(line: 119, column: 5, scope: !85)
!104 = !DILocation(line: 121, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !20, line: 62, type: !4)
!107 = !DILocation(line: 62, column: 21, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !20, line: 63, type: !4)
!109 = !DILocation(line: 63, column: 21, scope: !105)
!110 = !DILocation(line: 63, column: 54, scope: !105)
!111 = !DILocation(line: 63, column: 37, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !20, line: 64, type: !4)
!113 = !DILocation(line: 64, column: 21, scope: !105)
!114 = !DILocation(line: 64, column: 55, scope: !105)
!115 = !DILocation(line: 64, column: 38, scope: !105)
!116 = !DILocation(line: 65, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !20, line: 65, column: 8)
!118 = !DILocation(line: 65, column: 8, scope: !105)
!119 = !DILocation(line: 68, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !20, line: 66, column: 5)
!121 = !DILocation(line: 68, column: 14, scope: !120)
!122 = !DILocation(line: 69, column: 5, scope: !120)
!123 = !DILocation(line: 73, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !20, line: 71, column: 5)
!125 = !DILocation(line: 73, column: 14, scope: !124)
!126 = !DILocalVariable(name: "source", scope: !127, file: !20, line: 76, type: !45)
!127 = distinct !DILexicalBlock(scope: !105, file: !20, line: 75, column: 5)
!128 = !DILocation(line: 76, column: 23, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !130, file: !20, line: 78, type: !51)
!130 = distinct !DILexicalBlock(scope: !127, file: !20, line: 77, column: 9)
!131 = !DILocation(line: 78, column: 20, scope: !130)
!132 = !DILocation(line: 80, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !20, line: 80, column: 13)
!134 = !DILocation(line: 80, column: 18, scope: !133)
!135 = !DILocation(line: 80, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !20, line: 80, column: 13)
!137 = !DILocation(line: 80, column: 27, scope: !136)
!138 = !DILocation(line: 80, column: 13, scope: !133)
!139 = !DILocation(line: 82, column: 24, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !20, line: 81, column: 13)
!141 = !DILocation(line: 82, column: 17, scope: !140)
!142 = !DILocation(line: 82, column: 27, scope: !140)
!143 = !DILocation(line: 82, column: 34, scope: !140)
!144 = !DILocation(line: 83, column: 24, scope: !140)
!145 = !DILocation(line: 83, column: 17, scope: !140)
!146 = !DILocation(line: 83, column: 27, scope: !140)
!147 = !DILocation(line: 83, column: 34, scope: !140)
!148 = !DILocation(line: 84, column: 13, scope: !140)
!149 = !DILocation(line: 80, column: 35, scope: !136)
!150 = !DILocation(line: 80, column: 13, scope: !136)
!151 = distinct !{!151, !138, !152, !76}
!152 = !DILocation(line: 84, column: 13, scope: !133)
!153 = !DILocation(line: 87, column: 17, scope: !127)
!154 = !DILocation(line: 87, column: 9, scope: !127)
!155 = !DILocation(line: 88, column: 26, scope: !127)
!156 = !DILocation(line: 88, column: 9, scope: !127)
!157 = !DILocation(line: 90, column: 1, scope: !105)
