; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  store i8* %2, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType* %myStruct, i32 0, i32 0, !dbg !36
  store i8* %4, i8** %structFirst, align 8, !dbg !37
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType* %myStruct, i32 0, i32 0, !dbg !38
  %5 = load i8*, i8** %coerce.dive, align 8, !dbg !38
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67b_badSink(i8* %5), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67b_badSink(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #4, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #4, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType* %myStruct, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = alloca i8, i64 50, align 16, !dbg !69
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %1 = alloca i8, i64 100, align 16, !dbg !72
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !71
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !73
  store i8* %2, i8** %data, align 8, !dbg !74
  %3 = load i8*, i8** %data, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !75
  store i8 0, i8* %arrayidx, align 1, !dbg !76
  %4 = load i8*, i8** %data, align 8, !dbg !77
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType* %myStruct, i32 0, i32 0, !dbg !78
  store i8* %4, i8** %structFirst, align 8, !dbg !79
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType* %myStruct, i32 0, i32 0, !dbg !80
  %5 = load i8*, i8** %coerce.dive, align 8, !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67b_goodG2BSink(i8* %5), !dbg !80
  ret void, !dbg !81
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67b_goodG2BSink(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocalVariable(name: "myStruct", scope: !13, file: !14, line: 34, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType", file: !14, line: 24, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_structType", file: !14, line: 21, size: 64, elements: !22)
!22 = !{!23}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !21, file: !14, line: 23, baseType: !4, size: 64)
!24 = !DILocation(line: 34, column: 76, scope: !13)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 35, type: !4)
!26 = !DILocation(line: 35, column: 12, scope: !13)
!27 = !DILocation(line: 35, column: 36, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 36, type: !4)
!29 = !DILocation(line: 36, column: 12, scope: !13)
!30 = !DILocation(line: 36, column: 37, scope: !13)
!31 = !DILocation(line: 39, column: 12, scope: !13)
!32 = !DILocation(line: 39, column: 10, scope: !13)
!33 = !DILocation(line: 40, column: 5, scope: !13)
!34 = !DILocation(line: 40, column: 13, scope: !13)
!35 = !DILocation(line: 41, column: 28, scope: !13)
!36 = !DILocation(line: 41, column: 14, scope: !13)
!37 = !DILocation(line: 41, column: 26, scope: !13)
!38 = !DILocation(line: 42, column: 5, scope: !13)
!39 = !DILocation(line: 43, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_67_good", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 67, column: 5, scope: !40)
!42 = !DILocation(line: 68, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 80, type: !44, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !14, line: 80, type: !46)
!49 = !DILocation(line: 80, column: 14, scope: !43)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !14, line: 80, type: !47)
!51 = !DILocation(line: 80, column: 27, scope: !43)
!52 = !DILocation(line: 83, column: 22, scope: !43)
!53 = !DILocation(line: 83, column: 12, scope: !43)
!54 = !DILocation(line: 83, column: 5, scope: !43)
!55 = !DILocation(line: 85, column: 5, scope: !43)
!56 = !DILocation(line: 86, column: 5, scope: !43)
!57 = !DILocation(line: 87, column: 5, scope: !43)
!58 = !DILocation(line: 90, column: 5, scope: !43)
!59 = !DILocation(line: 91, column: 5, scope: !43)
!60 = !DILocation(line: 92, column: 5, scope: !43)
!61 = !DILocation(line: 94, column: 5, scope: !43)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !14, line: 54, type: !4)
!64 = !DILocation(line: 54, column: 12, scope: !62)
!65 = !DILocalVariable(name: "myStruct", scope: !62, file: !14, line: 55, type: !20)
!66 = !DILocation(line: 55, column: 76, scope: !62)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !62, file: !14, line: 56, type: !4)
!68 = !DILocation(line: 56, column: 12, scope: !62)
!69 = !DILocation(line: 56, column: 36, scope: !62)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !62, file: !14, line: 57, type: !4)
!71 = !DILocation(line: 57, column: 12, scope: !62)
!72 = !DILocation(line: 57, column: 37, scope: !62)
!73 = !DILocation(line: 59, column: 12, scope: !62)
!74 = !DILocation(line: 59, column: 10, scope: !62)
!75 = !DILocation(line: 60, column: 5, scope: !62)
!76 = !DILocation(line: 60, column: 13, scope: !62)
!77 = !DILocation(line: 61, column: 28, scope: !62)
!78 = !DILocation(line: 61, column: 14, scope: !62)
!79 = !DILocation(line: 61, column: 26, scope: !62)
!80 = !DILocation(line: 62, column: 5, scope: !62)
!81 = !DILocation(line: 63, column: 1, scope: !62)
