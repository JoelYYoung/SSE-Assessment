; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType = type { i8* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_badSink(i8* %myStruct.coerce) #0 !dbg !9 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType* %myStruct, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !23
  %0 = load i8*, i8** %structFirst, align 8, !dbg !23
  store i8* %0, i8** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !24, metadata !DIExpression()), !dbg !29
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !29
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !31
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !32
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !33
  %add = add i64 %call, 1, !dbg !34
  %mul = mul i64 %add, 1, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !36
  call void @printLine(i8* %3), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_goodG2BSink(i8* %myStruct.coerce) #0 !dbg !39 {
entry:
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType, align 8
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType* %myStruct, i32 0, i32 0
  store i8* %myStruct.coerce, i8** %coerce.dive, align 8
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType* %myStruct, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i8** %data, metadata !42, metadata !DIExpression()), !dbg !43
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType* %myStruct, i32 0, i32 0, !dbg !44
  %0 = load i8*, i8** %structFirst, align 8, !dbg !44
  store i8* %0, i8** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !47
  %2 = load i8*, i8** %data, align 8, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !49
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i64 @strlen(i8* %arraydecay1) #5, !dbg !51
  %add = add i64 %call, 1, !dbg !52
  %mul = mul i64 %add, 1, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !49
  %3 = load i8*, i8** %data, align 8, !dbg !54
  call void @printLine(i8* %3), !dbg !55
  ret void, !dbg !56
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_badSink", scope: !10, file: !10, line: 33, type: !11, scopeLine: 34, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType", file: !10, line: 29, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67_structType", file: !10, line: 26, size: 64, elements: !15)
!15 = !{!16}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !14, file: !10, line: 28, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "myStruct", arg: 1, scope: !9, file: !10, line: 33, type: !13)
!20 = !DILocation(line: 33, column: 156, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 35, type: !17)
!22 = !DILocation(line: 35, column: 12, scope: !9)
!23 = !DILocation(line: 35, column: 28, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !25, file: !10, line: 37, type: !26)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 36, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 37, column: 14, scope: !25)
!30 = !DILocation(line: 40, column: 16, scope: !25)
!31 = !DILocation(line: 40, column: 9, scope: !25)
!32 = !DILocation(line: 40, column: 38, scope: !25)
!33 = !DILocation(line: 40, column: 31, scope: !25)
!34 = !DILocation(line: 40, column: 46, scope: !25)
!35 = !DILocation(line: 40, column: 51, scope: !25)
!36 = !DILocation(line: 41, column: 19, scope: !25)
!37 = !DILocation(line: 41, column: 9, scope: !25)
!38 = !DILocation(line: 43, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_67b_goodG2BSink", scope: !10, file: !10, line: 50, type: !11, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "myStruct", arg: 1, scope: !39, file: !10, line: 50, type: !13)
!41 = !DILocation(line: 50, column: 160, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !10, line: 52, type: !17)
!43 = !DILocation(line: 52, column: 12, scope: !39)
!44 = !DILocation(line: 52, column: 28, scope: !39)
!45 = !DILocalVariable(name: "source", scope: !46, file: !10, line: 54, type: !26)
!46 = distinct !DILexicalBlock(scope: !39, file: !10, line: 53, column: 5)
!47 = !DILocation(line: 54, column: 14, scope: !46)
!48 = !DILocation(line: 57, column: 16, scope: !46)
!49 = !DILocation(line: 57, column: 9, scope: !46)
!50 = !DILocation(line: 57, column: 38, scope: !46)
!51 = !DILocation(line: 57, column: 31, scope: !46)
!52 = !DILocation(line: 57, column: 46, scope: !46)
!53 = !DILocation(line: 57, column: 51, scope: !46)
!54 = !DILocation(line: 58, column: 19, scope: !46)
!55 = !DILocation(line: 58, column: 9, scope: !46)
!56 = !DILocation(line: 60, column: 1, scope: !39)
